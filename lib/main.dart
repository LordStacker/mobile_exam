import 'package:exam_project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'services/GlobalSettingsService.dart';
import 'ui/views/alerts.dart';
import 'ui/views/login.dart';
import 'ui/views/measurements.dart';
import 'ui/views/newuser.dart';
import 'ui/views/settings.dart';

void main() async {
  final GlobalSettings globalSettings = GlobalSettings();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
