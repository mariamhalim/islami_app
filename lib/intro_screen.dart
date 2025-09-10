import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart' show AppColors;
import 'package:islami/utils/app_routes.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: AppColors.blackColor,
      pages: [
        PageViewModel(
          title: "",
          bodyWidget: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AppAssets.inLogo),
                const SizedBox(height: 20),
                Image.asset(AppAssets.page1),
                const SizedBox(height: 20),
                Text(
                  "Welcome to Islami App ",
                  style: TextStyle(
                    color: AppColors.goldColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              color: AppColors.goldColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(color: AppColors.goldColor, fontSize: 18),
          ),
        ),

        PageViewModel(
          title: "",

          bodyWidget: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AppAssets.inLogo),
                const SizedBox(height: 20),
                Image.asset(AppAssets.page2),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  "Welcome To Islami\nWe Are Very Excited To Have You In Our Community",
                  style: TextStyle(
                    color: AppColors.goldColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              color: AppColors.goldColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(color: AppColors.goldColor, fontSize: 18),
          ),
        ),

        PageViewModel(
          title: "",

          bodyWidget: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AppAssets.inLogo),
                const SizedBox(height: 20),
                Image.asset(AppAssets.page3),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  "Reading the Quran\nRead, and your Lord is the Most Generous",
                  style: TextStyle(
                    color: AppColors.goldColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              color: AppColors.goldColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(color: AppColors.goldColor, fontSize: 18),
          ),
        ),
        PageViewModel(
          title: "",

          bodyWidget: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AppAssets.inLogo),
                const SizedBox(height: 20),
                Image.asset(AppAssets.page4),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  "Bearish\nPraise the name of your Lord, the Most High",
                  style: TextStyle(
                    color: AppColors.goldColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              color: AppColors.goldColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(color: AppColors.goldColor, fontSize: 18),
          ),
        ),
        PageViewModel(
          title: "",

          bodyWidget: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AppAssets.inLogo),
                const SizedBox(height: 20),
                Image.asset(AppAssets.page5),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  "Holy Quran Radio\nYou can listen to the Holy Quran Radio through the"
                  " application for free and easily",
                  style: TextStyle(
                    color: AppColors.goldColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              color: AppColors.goldColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(color: AppColors.goldColor, fontSize: 18),
          ),
        ),
      ],
      onDone: () {
        Navigator.pushReplacementNamed(context, AppRoutes.RouteHomeScreen);
      },
      showSkipButton: false,
      showBackButton: true,
      back: const Text(
        "Back",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.goldColor,
        ),
      ),
      next: const Text(
        "Next",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.goldColor,
        ),
      ),
      done: const Text(
        "Finish",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.goldColor,
        ),
      ),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: AppColors.goldColor,
        color: AppColors.greyColor,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
