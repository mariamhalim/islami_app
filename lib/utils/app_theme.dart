import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    canvasColor: AppColors.goldColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
  );
}
