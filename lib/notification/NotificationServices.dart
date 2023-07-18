import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings setting = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
    if (setting.authorizationStatus == AuthorizationStatus.authorized) {
      print('User Granted Permission');
    } else if (setting.authorizationStatus == AuthorizationStatus.provisional) {
      print(' User ProvitionalPermission');
    } else {
      print("User Denied Permission");
    }
  }

  void initLocalNotification(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSetting =
        const AndroidInitializationSettings('@minmap/ic_launcher');
    var iosInitializationSetting = const DarwinInitializationSettings();
    var initializatioonSetting = InitializationSettings(
        android: androidInitializationSetting, iOS: iosInitializationSetting);

    await flutterLocalNotificationsPlugin.initialize(initializatioonSetting,
        onDidReceiveBackgroundNotificationResponse: (payload) {});
  }

  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((massage) {
      print(massage.notification?.title.toString());
      print(massage.notification?.body.toString());
      showNotification(massage);
    });
  }

  Future<void> showNotification(RemoteMessage massage) async {}

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }
}
