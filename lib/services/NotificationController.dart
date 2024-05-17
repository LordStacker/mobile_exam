import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationController {
  NotificationController._privateConstructor();

  static final NotificationController _instance =
      NotificationController._privateConstructor();

  factory NotificationController() {
    return _instance;
  }

  static List notificationList = [];

  static onMessage(RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      notificationList.add(ConvertMessageToMap(message));
    }
  }

  static Future<void> onBackgroundMessage(RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();

    print("Handling a background message: ${message.messageId}");
  }

  static ConvertMessageToMap(RemoteMessage message) {
    Map<String, dynamic> messageMap = {
      'title': message.notification?.title,
      'body': message.notification?.body,
      'data': message.data,
    };
    return messageMap;
  }

  static List getNotifications() {
    return notificationList;
  }
}
