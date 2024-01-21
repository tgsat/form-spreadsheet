import 'package:flutter/material.dart';
import 'package:spreadsheet/utils/utils.dart';

class AppSize {
  static double maxHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double maxWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double headlineTextDesktop(BuildContext context) {
    return isFontSize(context, 36);
  }

  static double headlineTextTab(BuildContext context) {
    return isFontSize(context, 30);
  }

  static double headlineTextMobile(BuildContext context) {
    return isFontSize(context, 28);
  }

  static double bodyTextDesktop(BuildContext context) {
    return isFontSize(context, 18);
  }

  static double bodyTextTab(BuildContext context) {
    return isFontSize(context, 18);
  }

  static double bodyTextMobile(BuildContext context) {
    return isFontSize(context, 16);
  }
}
