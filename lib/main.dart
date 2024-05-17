import 'package:exam_project/firebase_options.dart';
import 'package:exam_project/services/NotificationController.dart';
import 'package:exam_project/services/NotificationService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'ui/views/alerts.dart';
import 'ui/views/login.dart';
import 'ui/views/measurements.dart';
import 'ui/views/newuser.dart';
import 'ui/views/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  NotificationService();
  NotificationController();

  print('token: ${await FirebaseMessaging.instance.getToken()}');

  runApp(MaterialApp(
    initialRoute: '/login', // This is the route that the app will start on
    routes: {
      '/measurements': (context) => Measurements(), // Home route
      '/login': (context) => Login(), // Login route
      '/newuser': (context) => NewUser(), // New User route
      '/alerts': (context) => Alerts(), // Alerts route
      '/settings': (context) => Settings(), // Settings route
    },
  ));
}
