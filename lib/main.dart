import 'package:flutter/material.dart';
import 'ui/views/login.dart';
import 'ui/views/measurements.dart';
import 'ui/views/alerts.dart';
import 'ui/views/settings.dart';
import 'ui/views/newuser.dart';

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