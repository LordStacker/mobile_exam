import 'package:flutter/material.dart';

import '../widgets/BottomNavbar.dart';
import '../widgets/NotificationWidget.dart';

class Alerts extends StatelessWidget {
  const Alerts({super.key});

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
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: NotificationWidget(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: NotificationWidget(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: NotificationWidget(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: NotificationWidget(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: NotificationWidget(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: NotificationWidget(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: NotificationWidget(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: NotificationWidget(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: NotificationWidget(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: NotificationWidget(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: NotificationWidget(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: NotificationWidget(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: NotificationWidget(),
            ),
          ],
        ),
      )),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
