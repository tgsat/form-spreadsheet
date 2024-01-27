import 'package:flutter/material.dart';
import 'package:spreadsheet/utils/utils.dart';

class CustomCard {
  static BoxDecoration cardPrimary() {
    return BoxDecoration(
      color: AppColor.whiteColor,
      borderRadius: BorderRadius.circular(0),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0, 2),
          blurRadius: 3,

          // You can set this blurRadius as per your requirement
        ),
      ],
    );
  }

  static BoxDecoration cardButton() {
    return BoxDecoration(
      color: AppColor.primaryColor,
      borderRadius: BorderRadius.circular(0),
    );
  }
}
