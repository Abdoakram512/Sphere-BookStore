import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sphere_book_app/core/components/custom_text_form_field.dart';
import 'package:sphere_book_app/core/theme/text_styles.dart';
import 'package:sphere_book_app/core/utils/app_colors.dart';
import 'package:sphere_book_app/features/auth/presentation/views/widgets/auth_footer.dart';
import 'package:sphere_book_app/features/auth/presentation/views/widgets/auth_header.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TapGestureRecognizer _tapRecognizer;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        context.pop();
      };
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthHeader(
                  title: 'Sign Up',
                  subtitle: 'Create account and choose favorite menu',
                ),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  title: 'Name',
                  fillColor: AppColors.grey50,
                  hintText: 'Your name',
                  controller: nameController,
                ),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  title: 'Email',
                  fillColor: AppColors.grey50,
                  hintText: 'Your email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  title: 'Password',
                  prefixIconPath: null, // CustomTextFormField handles this
                  fillColor: AppColors.grey50,
                  hintText: 'Your password',
                  obscureText: true,
                  controller: passwordController,
                ),
                SizedBox(height: 24.h),
                Center(
                  child: SizedBox(
                    width: 347.w,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Implement registration logic
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                      child: Text(
                        'Register',
                        style: AppTextStyles.h16Bold.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: AppTextStyles.bodyLargeMedium.copyWith(
                        color: AppColors.grey500,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style: AppTextStyles.bodyLargeMedium.copyWith(
                            color: AppColors.primary900,
                          ),
                          recognizer: _tapRecognizer,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 138.h),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "By clicking Register, you agree to our\n ",
                        style: AppTextStyles.bodySmallMedium.copyWith(
                          color: AppColors.grey500,
                          height: 1.6,
                        ),
                        children: [
                          TextSpan(
                            text: "Terms and Data Policy.",
                            style: AppTextStyles.bodySmallSemiBold.copyWith(
                              color: AppColors.grey900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                const AuthFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
