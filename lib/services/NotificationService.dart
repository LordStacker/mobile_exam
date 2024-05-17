import 'package:firebase_messaging/firebase_messaging.dart';

import '../main.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

void handleMessage(RemoteMessage? message) {
  if (message == null) return;

  navigatorKey.currentState?.pushNamed('/alerts', arguments: message);
}

Future initPushNotifications() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
}

class NotificationService {
  NotificationService._privateConstructor();

  static final NotificationService _instance =
      NotificationService._privateConstructor();

  factory NotificationService() {
    return _instance;
  }

  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();
    print('Token: $token');
    initPushNotifications();
  }
}
