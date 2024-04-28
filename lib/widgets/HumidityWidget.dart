import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HumitdityWidget extends StatefulWidget {
  const HumitdityWidget({super.key});

  @override
  State<HumitdityWidget> createState() => _HumitdityWidgetState();
}

class _HumitdityWidgetState extends State<HumitdityWidget> {
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
                                'Normal',
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
