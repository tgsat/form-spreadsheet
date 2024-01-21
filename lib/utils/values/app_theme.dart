import 'package:flutter/material.dart';
import 'package:spreadsheet/utils/utils.dart';

class AppTheme {
  static ThemeData themeData(BuildContext context) {
    return ThemeColors.lightTheme;
  }
}

class ThemeColors {
  const ThemeColors._();

  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'OpenSans',
      primaryColor: AppColor.primaryColor,
      backgroundColor: AppColor.backgroundColor,
      scaffoldBackgroundColor: AppColor.backgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(backgroundColor: AppColor.primaryColor),
      textTheme: const TextTheme(
        button: TextStyle(color: AppColor.whiteColor),
      ).copyWith(
        headline1: const AppFonts().headline,
        bodyText1: const AppFonts().text,
        bodyText2: const AppFonts().body,
      ));
}
