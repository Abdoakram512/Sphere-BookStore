import 'package:go_router/go_router.dart';
import 'package:sphere_book_app/features/auth/presentation/views/login_view.dart';
import 'package:sphere_book_app/core/helpers/cache_helpers.dart';
import 'package:sphere_book_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:sphere_book_app/features/splash/presentation/views/splash_view.dart';
import 'package:sphere_book_app/core/config/routes/route_constants.dart'
    as routes;

class AppRouter {
  static final router = GoRouter(
    initialLocation: CacheHelper.getBoolData('isFirstTime') ?? true
        ? '/'
        : routes.homeScreen,
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: routes.onBoarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: routes.loginScreen,
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
