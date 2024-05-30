import 'package:exam_project/services/GlobalSettingsService.dart';
import 'package:flutter/material.dart';

import '../widgets/BottomNavbar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F3FF),
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xffF0F3FF)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: const Color(0xff211951),
          title: const Text('Settings'),
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffF0F3FF),
          )),
      body: Center(
          child: SizedBox(
        height: 450,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: const Color(0xff211951),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Use Celsius',
                      style: TextStyle(color: Color(0xffF0F3FF), fontSize: 20)),
                  Switch(
                    value: GlobalSettings().isCelsius,
                    onChanged: (bool value) {
                      setState(() {
                        GlobalSettings().toggleCelsius();
                      });
                    },
                    activeTrackColor: const Color(0xff15F5BA),
                    activeColor: const Color(0xffF0F3FF),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: const Color(0xff211951),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Use 24 Hour Time',
                      style: TextStyle(color: Color(0xffF0F3FF), fontSize: 20)),
                  Switch(
                    value: GlobalSettings().is24Hour,
                    onChanged: (bool value) {
                      setState(() {
                        GlobalSettings().toggle24Hour();
                      });
                    },
                    activeTrackColor: const Color(0xff15F5BA),
                    activeColor: const Color(0xffF0F3FF),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: const Color(0xff211951),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Enable Alerts',
                      style: TextStyle(color: Color(0xffF0F3FF), fontSize: 20)),
                  Switch(
                    value: GlobalSettings().enableNotifications,
                    onChanged: (bool value) {
                      setState(() {
                        GlobalSettings().toggleNotifications();
                      });
                    },
                    activeTrackColor: const Color(0xff15F5BA),
                    activeColor: const Color(0xffF0F3FF),
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
