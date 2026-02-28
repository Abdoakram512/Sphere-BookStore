import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:sphere_book_app/core/services/local_notification_service.dart';
import 'package:sphere_book_app/core/config/routes/route_constants.dart';

class PushNotificationService {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<void> init() async {
    await firebaseMessaging.requestPermission();

    firebaseMessaging.getToken().then((token) {
      log("FCM Token: $token");
      if (token != null) sendTokenToServer(token);
    });
    firebaseMessaging.onTokenRefresh.listen(sendTokenToServer);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("Foreground Message: ${message.notification?.title}");
      LocalNotificationService.showBasicNotification(message);
    });

    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

    RemoteMessage? initialMessage = await firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      _handleNotificationClick(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNotificationClick(message);
    });
  }

  static Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log("Background Message: ${message.messageId}");
  }

  static void _handleNotificationClick(RemoteMessage message) {
    final data = message.data;

    String screen = data['screen'] ?? ordersScreen;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 500));

      if (navigatorKey.currentState != null) {
        navigatorKey.currentState?.pushNamed(
          screen,
          arguments: {
            ...data,
            'title': message.notification?.title ?? data['title'],
            'body': message.notification?.body ?? data['body'],
          },
        );
      } else {
        log("NavigatorKey is still null, notification click ignored");
      }
    });
  }

  static void sendTokenToServer(String token) {
    log("FCM Token: $token");
  }
}
