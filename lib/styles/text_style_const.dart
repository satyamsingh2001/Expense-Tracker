import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle _getTextStyle(double size, FontWeight fontWeight) {
    return GoogleFonts.lato(
      fontSize: size.sp,
      fontWeight: fontWeight,
    );
  }

  static TextStyle kLargeTitleTextStyle = _getTextStyle(36, FontWeight.bold);
  static TextStyle kHeading1TextStyle = _getTextStyle(32, FontWeight.bold);
  static TextStyle kHeading2TextStyle = _getTextStyle(28, FontWeight.w600);
  static TextStyle kHeading2RegularTextStyle = _getTextStyle(28, FontWeight.normal);
  static TextStyle kHeading3TextStyle = _getTextStyle(22, FontWeight.w600);
  static TextStyle kHeading3RegularTextStyle = _getTextStyle(22, FontWeight.normal);
  static TextStyle kBody20RegularTextStyle = _getTextStyle(20, FontWeight.normal);
  static TextStyle kBody20SemiBoldTextStyle = _getTextStyle(20, FontWeight.w600);
  static TextStyle kBody17RegularTextStyle = _getTextStyle(17, FontWeight.normal);
  static TextStyle kBody17SemiBoldTextStyle = _getTextStyle(17, FontWeight.w600);
  static TextStyle kBody15RegularTextStyle = _getTextStyle(15, FontWeight.normal);
  static TextStyle kBody15SemiBoldTextStyle = _getTextStyle(15, FontWeight.w600);
  static TextStyle kCaption12RegularTextStyle = _getTextStyle(12, FontWeight.normal);
  static TextStyle kCaption12SemiBoldTextStyle = _getTextStyle(12, FontWeight.w600);
  static TextStyle kSmall10RegularTextStyle = _getTextStyle(10, FontWeight.normal);
  static TextStyle kSmall10SemiBoldTextStyle = _getTextStyle(10, FontWeight.w600);
  static TextStyle kSmall8RegularTextStyle = _getTextStyle(8, FontWeight.normal);
  static TextStyle kSmall8SemiBoldTextStyle = _getTextStyle(8, FontWeight.w600);
}
