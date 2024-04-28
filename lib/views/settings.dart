import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F3FF),
      appBar: AppBar(
          backgroundColor: Color(0xff211951),
          title: Text('Settings'),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffF0F3FF),
          )
      ),
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
                    Text('Use Celsius', style: TextStyle(color: Color(0xffF0F3FF), fontSize: 20)),
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
                    Text('Use 24 Hour Time', style: TextStyle(color: Color(0xffF0F3FF), fontSize: 20)),
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
                    Text('Enable Alerts', style: TextStyle(color: Color(0xffF0F3FF), fontSize: 20)),
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
        )
      ),
      bottomNavigationBar: Container( // This is the footer
          color: Color(0xff211951),
          height: 63.0,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: SvgPicture.asset(
                  'assets/svgs/meter.svg',
                  width: 30,
                  height: 30,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/alerts');
                },
                child: SvgPicture.asset(
                  'assets/svgs/Bell.svg',
                  width: 40,
                  height: 40,
                ),
              ),
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xff15F5BA),
                    width: 1,
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/svgs/Settings.svg',
                  width: 30,
                  height: 30,
                ),
              ),

            ],
          )

      ),
    );
  }
}
