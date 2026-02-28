import 'package:dio/dio.dart';

import 'package:sphere_book_app/core/api/api_constants/api_constants.dart';
import 'package:sphere_book_app/core/config/routes/app_router.dart';
import 'package:sphere_book_app/core/config/routes/route_constants.dart';
import 'package:sphere_book_app/core/helpers/secure_storage_helper.dart';
import 'package:sphere_book_app/core/di/dependency_injection.dart';
import 'package:sphere_book_app/core/utils/toast_helper.dart';

class AppInterceptor extends Interceptor {
  /// Guard: show the pending toast only once per screen visit.
  /// Reset when the user navigates away from the review screen.
  static bool _pendingToastShown = false;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await getIt<SecureStorageService>().read('token');

    // Public endpoints that should not include the Authorization header
    final publicEndpoints = [
      ApiConstants.login,
      ApiConstants.register,
      ApiConstants.forgetPassword,
      ApiConstants.verifyOtp,
      ApiConstants.resendOtp,
      ApiConstants.forgotPassword,
      ApiConstants.forgotVerifyOtp,
      ApiConstants.forgotResendOtp,
      ApiConstants.forgotResetPassword,
    ];

    if (token != null && !publicEndpoints.contains(options.path)) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 410) {
      // Check if we're NOT already on the review screen → first time arrival
      final currentLocation = AppRouter()
          .router
          .routerDelegate
          .currentConfiguration
          .last
          .matchedLocation;
      final isOnReviewScreen = currentLocation == reviewOrderScreen;

      // Logic:
      // 1. If we are NOT on the review screen, this is a new "entry" (like a login attempt).
      //    We should reset the flag to ensure the toast shows.
      if (!isOnReviewScreen) {
        _pendingToastShown = false;
      }

      // 2. Show toast if not already shown for this "session"
      if (!_pendingToastShown) {
        _pendingToastShown = true;

        final overlay = AppRouter()
            .router
            .routerDelegate
            .navigatorKey
            .currentState
            ?.overlay;

        if (overlay != null) {
          ToastHelper.showToastOnOverlay(
            overlay,
            message: 'حسابك قيد المراجعة، سيتم إعلامك عند الموافقة',
            type: ToastType.pending,
            duration: const Duration(seconds: 5),
          );
        }
      }

      // Navigate to review screen only if not already there
      if (!isOnReviewScreen) {
        AppRouter().router.go(reviewOrderScreen);
      }

      // IMPORTANT: Do NOT call super.onError — swallow the error to prevent
      // it from propagating to the cubit and showing a duplicate error toast.
      handler.resolve(
        Response(requestOptions: err.requestOptions, statusCode: 410),
      );
      return;
    }

    super.onError(err, handler);
  }

  /// Call this when navigating away from the review screen
  /// so the toast appears again on the next login attempt.
  static void resetPendingToastGuard() {
    _pendingToastShown = false;
  }
}
