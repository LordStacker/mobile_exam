import 'dart:async';
import 'dart:collection';

import 'package:exam_project/services/GlobalSettingsService.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//Message stream controller to notify alerts that a new message was recieved
final _messageController = StreamController<RemoteMessage>.broadcast();

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  handleMessage(message);
}

Future<void> handleForegroundMessage(RemoteMessage message) async {
  handleMessage(message);

  if (GlobalSettings().enableNotifications) {
    _messageController.add(message);
  }
}

void handleMessage(RemoteMessage? message) {
  if (message == null || !GlobalSettings().enableNotifications) return;

  NotificationService().addMessage(message);
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
  FirebaseMessaging.onMessage.listen(handleForegroundMessage);
}

final Queue<RemoteMessage> _messages = Queue<RemoteMessage>();

class NotificationService {
  NotificationService._privateConstructor();

  static final NotificationService _instance =
      NotificationService._privateConstructor();

  factory NotificationService() {
    return _instance;
  }

  final _firebaseMessaging = FirebaseMessaging.instance;

  Stream<RemoteMessage> get messageStream => _messageController.stream;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();
    print('Token: $token');
    initPushNotifications();
  }

  addMessage(RemoteMessage message) {
    _messages.add(message);
    if (_messages.length > 10) {
      _messages.removeFirst();
    }
  }

  getMessages() {
    return _messages;
  }

  removeMessage(String title) {
    _messages.removeWhere((element) => element.notification?.title == title);
  }
}
