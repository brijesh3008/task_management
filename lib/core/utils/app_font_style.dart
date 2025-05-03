import 'package:task_management/core/config/app_colors.dart';
import 'package:task_management/core/utils/app_size.dart';
import 'package:flutter/material.dart';

abstract class LmgFS {
  /// Default font family
  static const String defaultFontOfApp = 'Poppins';
  static const String _defaultFontFamily = defaultFontOfApp;
  //static var defaultFontColor = EiplColors().fontBlack;

  static TextStyle style(int size, {Color? fontColor, String? fontFamily}) {
    final defaultFontColor = AppColors.black;
    switch (size) {
      case 6:
        return TextStyle(
            fontFamily: fontFamily ?? _defaultFontFamily,
            fontSize: getFontSize(7),
            color: fontColor ?? defaultFontColor);

      case 8:
        return TextStyle(
            fontFamily: fontFamily ?? _defaultFontFamily,
            fontSize: getFontSize(9), //7.5.sp
            color: fontColor ?? defaultFontColor);

      case 10:
        return TextStyle(
            fontFamily: fontFamily ?? _defaultFontFamily,
            fontSize: getFontSize(9.6), //8.sp,
            color: fontColor ?? defaultFontColor);

      case 12:
        return TextStyle(
            fontFamily: fontFamily ?? _defaultFontFamily,
            fontSize: getFontSize(12), //10.sp,
            color: fontColor ?? defaultFontColor);

      case 14:
        return TextStyle(
            fontFamily: fontFamily ?? _defaultFontFamily,
            fontSize: getFontSize(13.2), //11.sp,
            color: fontColor ?? defaultFontColor);

      case 16:
        return TextStyle(
            fontFamily: fontFamily ?? _defaultFontFamily,
            fontSize: getFontSize(14.4), //12.sp,
            color: fontColor ?? defaultFontColor);

      case 18:
        return TextStyle(
            fontFamily: fontFamily ?? _defaultFontFamily,
            fontSize: getFontSize(16.8), //14.sp,
            color: fontColor ?? defaultFontColor);

      case 22:
        return TextStyle(
            fontFamily: fontFamily ?? _defaultFontFamily,
            fontSize: getFontSize(20.4), //17.sp,
            color: fontColor ?? defaultFontColor);

      case 26:
        return TextStyle(
            fontFamily: fontFamily ?? _defaultFontFamily,
            fontSize: getFontSize(24), //20.sp,
            color: fontColor ?? defaultFontColor);

      case 32:
        return TextStyle(
            fontFamily: fontFamily ?? _defaultFontFamily,
            fontSize: getFontSize(26.4), //22.sp,
            color: fontColor ?? defaultFontColor);

      case 40:
        return TextStyle(
            fontFamily: fontFamily ?? _defaultFontFamily,
            fontSize: getFontSize(36), //30.sp,
            color: fontColor ?? defaultFontColor);

      default:
        return TextStyle(
            fontFamily: fontFamily ?? _defaultFontFamily,
            fontSize: getFontSize(10.5), //12,
            color: fontColor ?? defaultFontColor);
    }
  }
}
