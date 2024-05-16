import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../widgets/BottomNavbar.dart';

class Alerts extends StatefulWidget {
  final RemoteMessage? message;

  const Alerts({super.key, this.message});

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F3FF),
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xffF0F3FF)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Color(0xff211951),
          title: Text('Alerts'),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffF0F3FF),
          )),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'You have a new notification:',
            ),
            Text(
              '${widget.message?.notification?.title ?? 'No title'}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '${widget.message?.notification?.body ?? 'No body'}',
            ),
          ],
        ),
      )),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
