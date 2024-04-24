import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/NotificationWidget.dart';

class Alerts extends StatelessWidget {
  const Alerts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F3FF),
      appBar: AppBar(
          backgroundColor: Color(0xff211951),
          title: Text('Environment Measurements'),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffF0F3FF),
          )
      ),
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
        )
      ),
      bottomNavigationBar: Container( // This is the footer
          color: Color(0xff211951),
          height: 60.0,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
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
                  'assets/svgs/meter.svg',
                  width: 30,
                  height: 30,
                ),
              ),
              SvgPicture.asset(
                'assets/svgs/Bell.svg',
                width: 40,
                height: 40,
              ),
              SvgPicture.asset(
                'assets/svgs/Settings.svg',
                width: 30,
                height: 30,
              ),
            ],
          )

      ),
    );
  }
}
