import 'package:flutter/material.dart';
import 'package:sphere_book_app/core/utils/app_colors.dart';
import 'package:sphere_book_app/features/on_boarding/data/models/on_boarding_model.dart';

class DotsIndicator extends StatelessWidget {
  final int currentPage;

  const DotsIndicator({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(onBoardingList.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentPage == index ? AppColors.grey900 : AppColors.grey200,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
