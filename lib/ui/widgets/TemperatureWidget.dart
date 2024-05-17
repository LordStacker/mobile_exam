import 'package:exam_project/services/GlobalSettingsService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TemperatureWidget extends StatefulWidget {
  final int temperature;

  const TemperatureWidget({super.key, required this.temperature});

  @override
  State<TemperatureWidget> createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  // This function is used to get the temperature symbol based on the global settings
  String processTemperature() {
    return GlobalSettings().isCelsius
        ? ('${widget.temperature} °C')
        : ('${(widget.temperature * 1.8) + 32} °F');
  }

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
              child: Container(
                height: 120,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xff211951),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Room Temperature',
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
                              'assets/svgs/Thermometer.svg',
                              width: 50,
                              height: 50,
                            ),
                            Container(
                              width: 100,
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Color(0xff615B85),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  '${processTemperature()}',
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
                    ]),
              ),
            )),
      ),
    );
  }
}
