import 'dart:io';

import 'package:task_management/injection_container.dart' as di;
import 'package:task_management/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:task_management/injection_container.dart';

import 'app/application.dart';
import 'bootstrap.dart';
import 'core/helpers/http_overrides.dart';
import 'core/hive_db/db_helper.dart';
import 'core/utils/app_local_preference.dart';
import 'core/utils/flutter_error_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// [AppFlutterErrorScreen] is the Custom error widget
  ErrorWidget.builder =
      (FlutterErrorDetails details) => AppFlutterErrorScreen(details: details);

  /// [di] is library prefix of [injection_container.dart]
  await di.setupLocator();

  DbHelper dbHelper = sl();
  await dbHelper.initHive();
  // await Firebase.initializeApp();

  LocalPreference prefs = sl();

  HttpOverrides.global = MyHttpOverrides();

  bootstrap(builder: () => const MyApp());
}
