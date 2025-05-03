import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'app_font_style.dart';

/// Screen For replacement of flutter red error Screen
class AppFlutterErrorScreen extends StatelessWidget {
  final FlutterErrorDetails details;
  const AppFlutterErrorScreen({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 200,
                    child: Lottie.asset(
                        'assets/animations/error_cat_animation.json')),
                const SizedBox(height: 20),
                Text(
                  details.exceptionAsString(),
                  style: LmgFS.style(11),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
