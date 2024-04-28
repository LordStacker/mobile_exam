import 'package:flutter/material.dart';
import 'views/login.dart';
import 'views/measurements.dart';
import 'views/alerts.dart';
import 'views/settings.dart';

void main()  => runApp(MaterialApp(
  initialRoute: '/', // This is the route that the app will start on
  routes: {
    '/': (context) => Measurements(), // Home route
    '/alerts': (context) => Alerts(), // Alerts route
    '/settings': (context) => Settings(), // Settings route
  },
));