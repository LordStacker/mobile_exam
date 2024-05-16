import 'package:flutter/material.dart';

import '../widgets/BottomNavbar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
          title: Text('Settings'),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffF0F3FF),
          )),
      body: Center(
          child: Container(
        height: 450,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Color(0xff211951),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Use Celsius',
                      style: TextStyle(color: Color(0xffF0F3FF), fontSize: 20)),
                  Switch(
                    value: true,
                    onChanged: (value) {
                      print(value);
                    },
                    activeTrackColor: Color(0xff15F5BA),
                    activeColor: Color(0xffF0F3FF),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Color(0xff211951),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Use 24 Hour Time',
                      style: TextStyle(color: Color(0xffF0F3FF), fontSize: 20)),
                  Switch(
                    value: true,
                    onChanged: (value) {
                      print(value);
                    },
                    activeTrackColor: Color(0xff15F5BA),
                    activeColor: Color(0xffF0F3FF),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Color(0xff211951),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Enable Alerts',
                      style: TextStyle(color: Color(0xffF0F3FF), fontSize: 20)),
                  Switch(
                    value: true,
                    onChanged: (value) {
                      print(value);
                    },
                    activeTrackColor: Color(0xff15F5BA),
                    activeColor: Color(0xffF0F3FF),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
