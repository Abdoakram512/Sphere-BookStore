import 'package:sphere_book_app/core/utils/app_images.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String description;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    image: AppImages.onBoarding1Svg,
    title: "Now reading books \n will be easier",
    description:
        "Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.",
  ),
  OnBoardingModel(
    image: AppImages.onBoarding2Svg,
    title: "Your Bookish Soulmate \n Awaits",
    description:
        "Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.",
  ),
  OnBoardingModel(
    image: AppImages.onBoarding3Svg,
    title: "Start Your Adventure",
    description:
        "Ready to embark on a quest for inspiration and knowledge? \nYour adventure begins now. Let's go!",
  ),
];
