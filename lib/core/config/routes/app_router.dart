import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sphere_book_app/core/di/dependency_injection.dart';
import 'package:sphere_book_app/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:sphere_book_app/features/auth/presentation/ui/forgot_password/create_new_password_screen.dart';
import 'package:sphere_book_app/features/auth/presentation/ui/login/login_screen.dart';
import 'package:sphere_book_app/features/auth/presentation/ui/register/register_screen.dart';
import 'package:sphere_book_app/features/account_review/presentation/account_review_screen.dart';
import 'package:sphere_book_app/features/auth/presentation/ui/register/vehicle_details_screen.dart';
import 'package:sphere_book_app/features/auth/presentation/ui/verification/verification_code_screen.dart';
import 'package:sphere_book_app/features/auth/presentation/ui/verification/verification_via_email_screen.dart';
import 'package:sphere_book_app/features/home/presentation/ui/account/account_details/profile_details_screen.dart';
import 'package:sphere_book_app/features/home/presentation/ui/account/account_menu_screen.dart';
import 'package:sphere_book_app/features/home/presentation/ui/account/notifications_screen.dart';
import 'package:sphere_book_app/features/home/presentation/ui/account/profile_vehicle_details_screen.dart';
import 'package:sphere_book_app/features/home/presentation/ui/account/terms_and_conditions_screen.dart';
import 'package:sphere_book_app/features/home/presentation/ui/main_wrapper.dart';
import 'package:sphere_book_app/features/home/presentation/ui/orders/orders_screen.dart';
import 'package:sphere_book_app/features/home/presentation/ui/orders_history/orders_history_screen.dart';
import 'package:sphere_book_app/features/order_details/presentation/ui/customer_info_screen.dart';
import 'package:sphere_book_app/features/order_details/presentation/ui/order_details_screen.dart';
import 'package:sphere_book_app/features/splash/presentation/ui/splash_screen.dart';

import 'route_constants.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._internal();
  factory AppRouter() => _instance;
  AppRouter._internal();

  final GoRouter router = GoRouter(
    initialLocation: splashScreen,
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      // GoRoute(
      //   path: biometricLoginScreen,
      //   builder: (context, state) => const BiometricLogin(),
      // ),
      // Registration Flow (Shared Cubit)
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: registerScreen,
            builder: (context, state) => const RegisterScreen(),
          ),
          GoRoute(
            path: vehicleDetailsScreen,
            builder: (context, state) => const RegisterVehicleDetailsScreen(),
          ),
          GoRoute(
            path: verificationViaEmailScreen,
            builder: (context, state) => const VerificationViaEmailScreen(),
          ),
          GoRoute(
            path: verificationCodeScreen,
            builder: (context, state) => const VerificationCodeScreen(),
          ),
        ],
      ),
      GoRoute(
        path: reviewOrderScreen,
        builder: (context, state) => const AccountReviewScreen(),
      ),
      GoRoute(
        path: createNewPasswordScreen,
        builder: (context, state) => const CreateNewPasswordScreen(),
      ),

      // Bottom Navigation Shell
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: ordersHistoryScreen,
                builder: (context, state) => const OrdersHistoryScreen(),
              ),
            ],
          ),
          // Orders Branch (Primary)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: ordersScreen,
                builder: (context, state) => const OrdersScreen(),
              ),
              GoRoute(
                path: orderDetailsScreen,
                builder: (context, state) => const OrderDetailsScreen(),
              ),
              GoRoute(
                path: customerInfoScreen,
                builder: (context, state) => const CustomerInfoScreen(),
              ),
              // homeScreen can be an alias for ordersScreen or a redirect
              GoRoute(
                path: homeScreen,
                redirect: (context, state) => ordersScreen,
              ),
            ],
          ),
          // Account Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: accountMenuScreen,
                builder: (context, state) => const AccountMenuScreen(),
              ),
              GoRoute(
                path: profileDetailsScreen,
                builder: (context, state) => const ProfileDetailsScreen(),
              ),
              GoRoute(
                path: profileVehicleDetailsScreen,
                builder: (context, state) =>
                    const ProfileVehicleDetailsScreen(),
              ),
              GoRoute(
                path: notificationsScreen,
                builder: (context, state) => const NotificationsScreen(),
              ),
              GoRoute(
                path: termsAndConditionsScreen,
                builder: (context, state) => const TermsAndConditionsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
