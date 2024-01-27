import 'package:flutter/material.dart';
import 'package:spreadsheet/utils/utils.dart';

class CustomAppBar {
  static AppBar general(BuildContext context, String title) {
    return AppBar(
        centerTitle: Responsive.isDesktop(context) ? false : true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w600,
              ),
        ));
  }
}
