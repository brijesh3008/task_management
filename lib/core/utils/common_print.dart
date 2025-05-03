import 'dart:developer';

import 'package:flutter/foundation.dart';

void logPrint(String message) {
  if (kDebugMode) {
    log(
      "[DEVELOPER LOG]: $message",
    );
  }
}
