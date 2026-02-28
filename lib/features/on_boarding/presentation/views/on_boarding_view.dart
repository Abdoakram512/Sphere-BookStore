import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sphere_book_app/core/config/routes/route_constants.dart'
    as routes;
import 'package:sphere_book_app/core/theme/text_styles.dart';
import 'package:sphere_book_app/core/utils/app_colors.dart';
import 'package:sphere_book_app/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:sphere_book_app/features/on_boarding/presentation/views/widgets/dots_indicator.dart';
import 'package:sphere_book_app/features/on_boarding/presentation/views/widgets/on_boarding_page_view_item.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: onBoardingList.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return OnBoardingPageViewItem(
                  onBoardingModel: onBoardingList[index],
                );
              },
            ),
          ),
          const SizedBox(height: 28),
          DotsIndicator(currentPage: currentPage),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  if (currentPage == onBoardingList.length - 1) {
                    context.go(routes.loginScreen);
                  } else {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.grey900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  currentPage == 0 ? "Continue" : "Get Started",
                  style: context.h6Bold.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  context.go(routes.loginScreen);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.primary50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Sign in",
                  style: context.h6Bold.copyWith(color: AppColors.primary900),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(width: 140, height: 5, color: AppColors.grey900),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
