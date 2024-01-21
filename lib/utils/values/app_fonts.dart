import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spreadsheet/utils/utils.dart';

class AppFonts {
  const AppFonts(
      {this.size = 12, this.fontWeight, this.color, this.height = 1.7});

  final double size;
  final FontWeight? fontWeight;
  final Color? color;
  final double height;

  TextStyle get headline {
    return GoogleFonts.montserrat(
      fontSize: size,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? AppColor.headlineColor,
      height: height,
    );
  }

  TextStyle get text {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? AppColor.textColor,
      height: height,
    );
  }

  TextStyle get body {
    return GoogleFonts.ptSans(
      fontSize: size,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? AppColor.textColor.withOpacity(0.8),
      height: height,
    );
  }
}
