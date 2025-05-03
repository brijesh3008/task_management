import 'package:task_management/core/config/app_routes.dart';
import 'package:task_management/core/utils/route_utils.dart';
import 'package:task_management/core/utils/scroll_behaviour.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/utils/full_scope_bloc_providers.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const bool _kTestingCrashlytics = false;

  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // static FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);

  Future<void> _initializeFlutterFire() async {
    if (_kTestingCrashlytics) {
      /// Force enable crashlytics collection enabled if we're testing it.
      // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } else {
      /// Else only enable it in non-debug builds.
      /// You could additionally extend this to allow users to opt-in.
      // await FirebaseCrashlytics.instance
      //     .setCrashlyticsCollectionEnabled(!kDebugMode);
    }
  }

  @override
  initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // _initializeFlutterFire();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

        /// [FullScopedBlocProviders] create all the BLOCs and CUBITs
        providers: FullScopedBlocProviders.providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,

          /// Warning
          scrollBehavior: MyCustomScrollBehaviour(),
          // navigatorObservers: <NavigatorObserver>[observer],
          title: 'Everest',
          routes: RouteUtils.routes,
          initialRoute: AppRoutes.splashPage,
          // home: PngHome(),
        ));
  }
}
