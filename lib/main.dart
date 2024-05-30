import 'package:exam_project/services/NotificationService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'ui/views/alerts.dart';
import 'ui/views/login.dart';
import 'ui/views/measurements.dart';
import 'ui/views/newuser.dart';
import 'ui/views/settings.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService().initNotifications();

  runApp(MaterialApp(
    initialRoute: '/login', // This is the route that the app will start on
    routes: {
      '/measurements': (context) => const Measurements(), // Home route
      '/login': (context) => const Login(), // Login route
      '/newuser': (context) => const NewUser(), // New User route
      '/alerts': (context) => const Alerts(), // Alerts route
      '/settings': (context) => const Settings(), // Settings route
    },
  ));
}
