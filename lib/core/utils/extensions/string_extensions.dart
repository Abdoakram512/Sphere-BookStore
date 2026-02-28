/// Extensions for String to provide helpful utility methods
extension StringExtensions on String {
  // ============================================================================
  // Capitalization
  // ============================================================================

  /// Capitalize the first letter of the string
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Capitalize the first letter of each word
  String get capitalizeWords {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// Convert to title case
  String get toTitleCase => capitalizeWords;

  // ============================================================================
  // Validation Helpers
  // ============================================================================

  /// Check if string is a valid email
  bool get isValidEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  /// Check if string is a valid phone number (simple check)
  bool get isValidPhone {
    final phoneRegex = RegExp(r'^\+?[\d\s-]{10,}$');
    return phoneRegex.hasMatch(this);
  }

  /// Check if string is a valid URL
  bool get isValidUrl {
    final urlRegex = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    );
    return urlRegex.hasMatch(this);
  }

  /// Check if string contains only numbers
  bool get isNumeric {
    return RegExp(r'^\d+$').hasMatch(this);
  }

  /// Check if string contains only letters
  bool get isAlpha {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(this);
  }

  /// Check if string contains only letters and numbers
  bool get isAlphanumeric {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);
  }

  // ============================================================================
  // Formatting Helpers
  // ============================================================================

  /// Remove all whitespace from string
  String get removeWhitespace {
    return replaceAll(RegExp(r'\s+'), '');
  }

  /// Remove extra whitespace (multiple spaces become one)
  String get removeExtraWhitespace {
    return replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  /// Convert to snake_case
  String get toSnakeCase {
    return replaceAll(RegExp(r'(?<!^)(?=[A-Z])'), '_').toLowerCase();
  }

  /// Convert to camelCase
  String get toCamelCase {
    if (isEmpty) return this;
    final words = split(RegExp(r'[_\s]+'));
    if (words.isEmpty) return this;

    return words.first.toLowerCase() +
        words.skip(1).map((word) => word.capitalize).join();
  }

  /// Truncate string to specified length with ellipsis
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength - ellipsis.length)}$ellipsis';
  }

  /// Reverse the string
  String get reverse {
    return split('').reversed.join();
  }

  // ============================================================================
  // Utility Methods
  // ============================================================================

  /// Check if string is null or empty
  bool get isNullOrEmpty {
    return isEmpty;
  }

  /// Check if string is not null and not empty
  bool get isNotNullOrEmpty {
    return isNotEmpty;
  }

  /// Remove all non-numeric characters
  String get numbersOnly {
    return replaceAll(RegExp(r'[^0-9]'), '');
  }

  /// Remove all non-alphabetic characters
  String get lettersOnly {
    return replaceAll(RegExp(r'[^a-zA-Z]'), '');
  }

  /// Check if string contains Arabic characters
  bool get hasArabic {
    return RegExp(r'[\u0600-\u06FF]').hasMatch(this);
  }

  /// Get file extension from filename
  String? get fileExtension {
    final lastDot = lastIndexOf('.');
    if (lastDot == -1) return null;
    return substring(lastDot + 1);
  }

  /// Remove file extension from filename
  String get withoutExtension {
    final lastDot = lastIndexOf('.');
    if (lastDot == -1) return this;
    return substring(0, lastDot);
  }

  /// Convert Arabic numbers to English numbers
  String get toEnglishNumbers {
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

    String result = this;
    for (int i = 0; i < arabic.length; i++) {
      result = result.replaceAll(arabic[i], english[i]);
    }
    return result;
  }
}
