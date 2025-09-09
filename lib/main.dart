import 'package:flutter/material.dart';
import 'package:islami/Home/home_screen.dart';
import 'package:islami/Home/taps/quran/sura_details/sura_details_screen.dart';
import 'package:islami/intro_screen.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.OnBoardingPage,
      routes: {
        AppRoutes.OnBoardingPage: (context) => OnBoardingScreen(),
        AppRoutes.RouteHomeScreen: (context) => HomeScreen(),
        AppRoutes.SuraDetailsScreen: (context) => SuraDetailsScreen(),
      },
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
