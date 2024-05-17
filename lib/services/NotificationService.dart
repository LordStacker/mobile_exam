import 'package:firebase_messaging/firebase_messaging.dart';

import 'NotificationController.dart';

class NotificationService {
  NotificationService._privateConstructor();

  static final NotificationService _instance =
      NotificationService._privateConstructor();

  factory NotificationService() {
    return _instance;
  }

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<bool> requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  void setupCallBacks() async {
    // Handle notifications when the app is in the foreground.
    FirebaseMessaging.onMessage.listen(NotificationController.onMessage);

    // Allow you to do something when a notification have been received while
    // the app is in the background.
    FirebaseMessaging.onBackgroundMessage(
        NotificationController.onBackgroundMessage);

    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // Handle message if we got one.
    if (initialMessage != null) {
      NotificationController.onMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp
        .listen(NotificationController.onMessage);
  }

  Stream<String?> get tokenStream async* {
    yield await messaging.getToken();
    yield* messaging.onTokenRefresh;
  }
}
