import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';
import 'package:spreadsheet/utils/utils.dart';

class CustomLoading {
  static Widget primary(String title, double size,
          {Color color = AppColor.whiteColor}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpinKitWanderingCubes(color: color),
          Space.y(2.w)!,
          Text(
            title,
            style: AppFonts(
              size: size,
              color: color,
              fontWeight: FontWeight.w500,
            ).text,
          )
        ],
      );
}
