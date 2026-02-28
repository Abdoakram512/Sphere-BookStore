import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sphere_book_app/core/config/routes/route_constants.dart'
    as routes;
import 'package:sphere_book_app/core/theme/text_styles.dart';
import 'package:sphere_book_app/core/utils/app_colors.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.go(routes.loginScreen);
      },
      child: Text(
        "Skip",
        style: context.body14Medium.copyWith(color: AppColors.grey900),
      ),
    );
  }
}
