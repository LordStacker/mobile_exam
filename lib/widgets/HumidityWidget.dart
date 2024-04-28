import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HumitdityWidget extends StatefulWidget {
  const HumitdityWidget({super.key});

  @override
  State<HumitdityWidget> createState() => _HumitdityWidgetState();
}

class _HumitdityWidgetState extends State<HumitdityWidget> {
  String retrievedHumidityLevel = 'Normal'; // This will be updated with the actual humidity level
  //late Timer _timer;//Timer to get the humidity level every n amounts of time

  //@override
 // void initState() {
 //   super.initState();
 //   _timer = Timer.periodic(Duration(seconds: 1), (timer) => getHumidityLevel());
 // } // This will get the Humidity level every second

  //@override
  //void dispose() {
 //   _timer.cancel();
//    super.dispose();
 // } // This will cancel the timer when the widget is disposed

  //Commented out the timer because there is no good API to use as a placholder for this, will remove comments when the actual API is available

  void getHumidityLevel() async {
    Response response = await get(Uri.parse('http://www.randomnumberapi.com/api/v1.0/random?min=0&max=99&count=1'));
    List data = jsonDecode(response.body);
    retrievedHumidityLevel = data[0];
    setState(() {});
  } // This will get the temperature level from the API

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 120,
        width: 300,
        child: Scaffold(
            backgroundColor: Color(0xff211951),
            body: Center(
              child:  Container(
                height: 120,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xff211951),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Room Humidity',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF0F3FF),
                        ),
                      ),

                      Container(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/svgs/Humidity.svg',
                              width: 40,
                              height: 40,
                            ),
                            Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Color(0xff615B85),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '$retrievedHumidityLevel',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffF0F3FF),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]
                ),
              ),
            )
        ),
      ),
    );
  }
}
