import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SoundWidget extends StatefulWidget {
  const SoundWidget({super.key});

  @override
  State<SoundWidget> createState() => _SoundWidgetState();
}

class _SoundWidgetState extends State<SoundWidget> {

  int retrievedSoundLevel = 0; // This will be updated with the actual sound level
  late Timer _timer;//Timer to get the sound level every n amounts of time

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) => getSoundLevel());
  } // This will get the sound level every second

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  } // This will cancel the timer when the widget is disposed


  void getSoundLevel() async {
    Response response = await get(Uri.parse('http://www.randomnumberapi.com/api/v1.0/random?min=0&max=99&count=1'));
    List data = jsonDecode(response.body);
    retrievedSoundLevel = data[0];
    setState(() {});
  } // This will get the sound level from the API



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
                          'Room Sound Level',
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
                                'assets/svgs/volume.svg',
                                width: 40,
                                height: 40,
                              ),
                              Container(
                                width: 70,
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  color: Color(0xff615B85),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    '$retrievedSoundLevel dB', // This will display the sound level
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffF0F3FF),
                                    ),
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
