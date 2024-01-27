import 'package:flutter/material.dart';
import 'package:spreadsheet/utils/utils.dart';

class CustomAppBar {
  static AppBar general(BuildContext context, String title) {
    return AppBar(
        centerTitle: Responsive.isDesktop(context)
            ? false
            : Responsive.isTablet(context)
                ? false
                : true,
        title: Text(title,
            style: const AppFonts(
                    size: 16,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w900)
                .text));
  }
}
