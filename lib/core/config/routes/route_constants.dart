/// Route constants for app navigation
///
/// Organized by feature groups for better maintainability
library;

// ============================================================================
// Authentication Routes
// ============================================================================

/// Splash screen route - initial app screen
const String splashScreen = '/';

/// Login screen route
const String loginScreen = '/login_screen';

/// Onboarding page view route
const String onBoarding = '/onboarding';

/// Biometric login screen route
const String biometricLoginScreen = '/biometric_login';

/// Registration screen route
const String registerScreen = '/register_view';

/// Create new password screen route (password reset flow)
const String createNewPasswordScreen = '/create_new_password';

/// Verification via email screen route
const String verificationViaEmailScreen = '/verification_via_email_screen';

/// Verification code screen route
const String verificationCodeScreen = '/verification_code_screen';

// ============================================================================
// Onboarding Routes
// ============================================================================

/// Vehicle details screen route (registration flow)
const String vehicleDetailsScreen = '/vehicle_details';

/// Review order screen route (registration flow)
const String reviewOrderScreen = '/review_order';

// ============================================================================
// Main App Routes
// ============================================================================

/// Home screen route - main app entry point after auth
const String homeScreen = '/home';

// ============================================================================
// Orders Routes
// ============================================================================

/// Orders screen route - main orders view
const String ordersScreen = '/orders';

/// Order details screen route
const String orderDetailsScreen = '/order_details';

/// In-progress order screen route
const String inProgressOrderScreen = '/in_progress_order';

/// Previous orders screen route
const String previousOrdersScreen = '/previous_orders';

/// Orders history screen route
const String ordersHistoryScreen = '/orders_history';

/// Customer information screen route
const String customerInfoScreen = '/customer_info';

// ============================================================================
// Account Routes
// ============================================================================

/// Account menu screen route (formerly overview)
const String accountMenuScreen = '/account_menu';

/// Profile details screen route
const String profileDetailsScreen = '/profile_details';

/// Profile vehicle details screen route
const String profileVehicleDetailsScreen = '/profile_vehicle_details';

/// Notifications screen route
const String notificationsScreen = '/notifications';

/// Terms and conditions screen route
const String termsAndConditionsScreen = '/terms_and_conditions';
