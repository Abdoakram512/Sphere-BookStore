import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

Future<XFile> compressImageFile({
  required File imageFile,
  int quality = 100,
  CompressFormat format = CompressFormat.jpeg,
}) async {
  try {
    // Check if source file exists
    if (!await imageFile.exists()) {
      throw ("Source image file does not exist at ${imageFile.path}");
    }

    final int originalSize = await imageFile.length();

    final Directory tempDir = await getTemporaryDirectory();
    final String extension = format == CompressFormat.jpeg
        ? 'jpg'
        : format.name.toLowerCase();

    final String targetPath = path.join(
      tempDir.path,
      'img_${DateTime.now().millisecondsSinceEpoch}.$extension',
    );

    debugPrint("Starting compression: ${imageFile.path}");

    final XFile? compressedImageFile =
        await FlutterImageCompress.compressAndGetFile(
          imageFile.path,
          targetPath,
          quality: quality,
          format: format,
        );

    if (compressedImageFile == null) {
      throw ("Image compression returned null!");
    }

    final File compressedFile = File(compressedImageFile.path);
    final int compressedSize = await compressedFile.length();

    // If compressed size is larger or equal to original, keep the original
    if (compressedSize >= originalSize) {
      debugPrint(
        "⚠️ Compression skipped: Output was larger than input ($compressedSize >= $originalSize)",
      );
      // Delete the larger file to save disk space
      try {
        await compressedFile.delete();
      } catch (_) {}
      return XFile(imageFile.path);
    }

    _logSizeComparison(originalSize, compressedSize);

    return compressedImageFile;
  } catch (e) {
    debugPrint("Error during image compression: $e");
    return XFile(imageFile.path);
  }
}

void _logSizeComparison(int original, int compressed) {
  final String originalStr = _formatSize(original);
  final String compressedStr = _formatSize(compressed);
  final double reduction = ((original - compressed) / original) * 100;

  debugPrint("📸 Image Compression Summary:");
  debugPrint("   - Original: $originalStr");
  debugPrint("   - Compressed: $compressedStr");
  debugPrint("   - Reduction: ${reduction.toStringAsFixed(1)}%");
}

String _formatSize(int bytes) {
  if (bytes < 1024) return "$bytes B";
  if (bytes < 1024 * 1024) return "${(bytes / 1024).toStringAsFixed(2)} KB";
  return "${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB";
}
