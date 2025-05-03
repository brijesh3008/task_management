import 'package:another_flushbar/flushbar.dart';
import 'package:task_management/core/config/app_colors.dart';
import 'package:task_management/core/utils/app_constansts.dart';
import 'package:task_management/core/utils/app_size.dart';
import 'package:task_management/core/utils/app_font_style.dart';
import 'package:flutter/material.dart';

/// [AppFlushBars] contains common flush bars
class AppFlushBars {
  AppFlushBars._();

  static appCommonFlushBar({
    required BuildContext context,
    required String message,
    required bool success,
  }) {
    /// If you want success flushbar then give true to success
    return Flushbar(
      messageText: Text(
        message,
        style: LmgFS.style(
          12,
          fontColor: AppColors.white,
        ),
      ),
      icon: Image.asset(
        success
            ? 'assets/icons/done_round.png'
            : 'assets/icons/cancel_round.png',
        height: getWidth(25),
        width: getWidth(25),
      ),
      margin: EdgeInsets.all(
        getWidth(18),
      ),
      backgroundColor: success ? AppColors.green : AppColors.redD2,
      isDismissible: true,
      animationDuration: AppConstants.animDuration300,
      borderRadius: BorderRadius.circular(6),
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(11),
        vertical: getHeight(9),
      ),
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
