// import 'dart:async';
// import 'dart:convert';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:sphere_book_app/core/services/push_notification_service.dart';
// import 'package:sphere_book_app/core/config/routes/route_constants.dart';

// class LocalNotificationService {
//   static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   static StreamController<NotificationResponse> streamController =
//       StreamController();

//   // (Initialization)
//   static Future init() async {
//     InitializationSettings settings = const InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       iOS: DarwinInitializationSettings(),
//     );

//     await flutterLocalNotificationsPlugin.initialize(
//       settings: settings,
//       onDidReceiveNotificationResponse: onTap,
//       onDidReceiveBackgroundNotificationResponse: onTap,
//     );

//     // Channel
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_channel',
//       'High Importance Notifications',
//       description: 'This channel is used for important notifications',
//       importance: Importance.high,
//     );

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin
//         >()
//         ?.createNotificationChannel(channel);
//   }

//   // Interaction
//   @pragma('vm:entry-point')
//   static void onTap(NotificationResponse response) {
//     if (response.payload != null) {
//       Map<String, dynamic> data = jsonDecode(response.payload!);
//       String screen = data['screen'] ?? ordersScreen;

//       PushNotificationService.navigatorKey.currentState?.pushNamed(
//         screen,
//         arguments: data,
//       );
//     }
//   }

//   // Show Notification
//   static void showBasicNotification(RemoteMessage message) async {
//     AndroidNotificationDetails android = AndroidNotificationDetails(
//       'high_importance_channel',
//       'Default Channel',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     // (Show Notification)
//     await flutterLocalNotificationsPlugin.show(
//       id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
//       title: message.notification?.title,
//       body: message.notification?.body,
//       notificationDetails: NotificationDetails(android: android),
//       payload: jsonEncode({
//         ...message.data,
//         'title': message.notification?.title,
//         'body': message.notification?.body,
//       }),
//     );
//   }
// }
