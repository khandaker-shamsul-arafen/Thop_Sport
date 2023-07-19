import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firsttest/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../views/screens/match_details.dart';
import '../views/screens/player.dart';
import '../views/screens/splash_scree.dart';

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

    await FirebaseMessaging.instance
        .subscribeToTopic('high_importance_channel');

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      print(message?.notification?.title.toString());
      print(message?.notification?.body.toString());
      dd((message?.toMap().toString() ?? '') + "abcdefghij");
      showNotification(message!);
    });
    FirebaseMessaging.onMessage.listen((massage) {
      print(massage.notification?.title.toString());
      print(massage.notification?.body.toString());
      dd(massage.toMap().toString() + "abcdefg");
      showNotification(massage);
    });
  }

  void initLocalNotification(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSetting =
        const AndroidInitializationSettings('@minmap/ic_launcher');
    var iosInitializationSetting = const DarwinInitializationSettings();
    var initializatioonSetting = InitializationSettings(
        android: androidInitializationSetting, iOS: iosInitializationSetting);

    await flutterLocalNotificationsPlugin.initialize(initializatioonSetting,
        onDidReceiveBackgroundNotificationResponse:
            (NotificationResponse payload) {
      dd(payload.payload.toString() + 'hjb,,nnabcd');
      handleMessage(context, message);
    });
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((massage) {
      print(massage.notification?.title.toString());
      print(massage.notification?.body.toString());
      initLocalNotification(context, massage);
      showNotification(massage);
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(1000000).toString(),
      'high_importance_channel',
      importance: Importance.max,
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: 'Your channel Description',
      priority: Priority.high,
      importance: Importance.high,
      ticker: 'ticker',
    );

    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    Future.delayed(Duration.zero, () {
      flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
        payload: message.data.toString(),
      );
    });
    handleMessage(Get.context!, message);
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      print('Device Token');
      print(event.toString());
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    dd(message.toMap().toString() + "abcd");
    if (message.data['type'] == 'player') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PlayerScreen()));
    }
  }
}
