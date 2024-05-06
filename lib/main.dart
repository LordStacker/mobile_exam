import 'package:flutter/material.dart';
import 'views/login.dart';
import 'views/measurements.dart';
import 'views/alerts.dart';
import 'views/settings.dart';
import 'views/newuser.dart';

void main()  => runApp(MaterialApp(
  initialRoute: '/login', // This is the route that the app will start on
  routes: {
    '/measurements': (context) => Measurements(), // Home route
    '/login': (context) => Login(), // Login route
    '/newuser': (context) => NewUser(), // New User route
    '/alerts': (context) => Alerts(), // Alerts route
    '/settings': (context) => Settings(), // Settings route
  },
));