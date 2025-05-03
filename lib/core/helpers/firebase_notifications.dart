import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/*
for execute onResume/onLaunch you need to add 'click_action' data to
FCM message with 'FLUTTER_NOTIFICATION_CLICK' value
so add this part to your message data
{...
'title' : 'any title',
'body' : 'anybody',
'data' : [{
...,
'click_action' : 'FLUTTER_NOTIFICATION_CLICK'
}]
 */

class FirebaseNotifications {
  static late FirebaseMessaging _firebaseMessaging;
  late final BuildContext buildContext;

  static FirebaseNotifications? _instance;

  factory FirebaseNotifications(BuildContext context) =>
      _instance ?? FirebaseNotifications._internal(context);

  FirebaseNotifications._internal(BuildContext context) {
    initialize(context);
  }

  void initialize(BuildContext context) {
    buildContext = context;
    _firebaseMessaging = FirebaseMessaging.instance;
    _NotificationHandler.initialize(buildContext);
    firebaseCloudMessagingListener();
  }

  static Future<dynamic> onBackgroundMessage(RemoteMessage message) async {
    debugPrint('remote message onBackgroundMessage');

    // if (message.containsKey('data')) {
    //   // Handle data message
    //   final dynamic data = message['data'];
    //   debugPrint("notification=======================+++++++++++++ $data");
    //   //showNotification();
    // }
    //
    // if (message.containsKey('notification')) {
    //   // Handle notification message
    //   final dynamic notification = message['notification'];
    //   debugPrint("notification===+++++++++++++ $notification");
    //   //showNotification();
    // }

    // Or do other work.

    //showNotification();

    //return _NotificationHandler.showNotification();
  }

  Future<void> firebaseCloudMessagingListener() async {
    if (Platform.isIOS) {
      _iOSPermission();
    }

    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      log('remote message initialMessage');
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessage.listen(_onMessageListener);

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

    _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  /// [_handleMessage] used for onCLick navigation of notification
  void _handleMessage(RemoteMessage message) {
    // Navigator.pushNamed(
    //   buildContext,
    //   EiplRoutes.notification,
    // );
  }

  static void _onMessageListener(RemoteMessage message) {
    _NotificationHandler.showNotification(message);
  }

  static Future<void> _iOSPermission() async {
    await _firebaseMessaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
    );
    _firebaseMessaging.getNotificationSettings();
  }

  static Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }
}

class _NotificationHandler {
  static final flutterLocalNotifications = FlutterLocalNotificationsPlugin();
  static BuildContext? context;

  static Future<void> initialize(BuildContext buildContext) async {
    context = buildContext;
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await flutterLocalNotifications.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: _onSelectNotification,
        onDidReceiveNotificationResponse: _onSelectFrontNotification);
    if (Platform.isIOS) {
      await flutterLocalNotifications
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions();
    } else {
      await flutterLocalNotifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }
  }

  static _onSelectNotification(NotificationResponse? payload) async {
    if (payload != null) {
      // Navigator.pushNamed(
      //   context!,
      //   EiplRoutes.notification,
      // );
    }
  }

  static _onSelectFrontNotification(NotificationResponse? payload) async {
    if (payload != null) {
      // Navigator.pushNamed(
      //   context!,
      //   EiplRoutes.notification,
      // );
    }
  }

  static Future<void> showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannel =
        AndroidNotificationDetails(
      'high_importance_channel', 'High Importance Notifications',
      channelShowBadge: false,
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('lmg_sonic'),
      //autoCancel: true,
      // onlyAlertOnce: true,
    );

    const NotificationDetails platformChannel = NotificationDetails(
      android: androidPlatformChannel,
    );

    // await flutterLocalNotifications
    //     .resolvePlatformSpecificImplementation
    //     <AndroidFlutterLocalNotificationsPlugin>()
    //     ?.createNotificationChannel(androidPlatformChannel);

    await flutterLocalNotifications.show(
      message.ttl ?? 0,
      message.notification?.title,
      message.notification?.body,
      platformChannel,
      payload: message.data['route'],
    );

    //final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // var androidNotificationChannel = AndroidNotificationChannel(
    //   "high_importance_channel",
    //   "High Importance Notifications",
    //   "This channel is used for important notifications.",
    //     importance: Importance.max,
    // );
    //
    // await flutterLocalNotificationsPlugin.
    // resolvePlatformSpecificImplementation
    // <AndroidFlutterLocalNotificationsPlugin>()
    //     ?.createNotificationChannel(androidNotificationChannel);
  }
}
