import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sphere_book_app/core/theme/text_styles.dart';
import 'package:sphere_book_app/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:sphere_book_app/features/on_boarding/presentation/views/widgets/skip_button.dart';

class OnBoardingPageViewItem extends StatelessWidget {
  const OnBoardingPageViewItem({super.key, required this.onBoardingModel});

  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SkipButton(),
          ),
        ),
        SvgPicture.asset(onBoardingModel.image),
        const SizedBox(height: 24),
        Text(
          onBoardingModel.title,
          style: context.h20Bold,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            onBoardingModel.description,
            style: context.bodyLargeMedium.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
