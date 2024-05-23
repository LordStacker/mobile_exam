import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SoundWidget extends StatefulWidget {
  final int sound;

  const SoundWidget({super.key, required this.sound});

  @override
  State<SoundWidget> createState() => _SoundWidgetState();
}

class _SoundWidgetState extends State<SoundWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 120,
        width: 300,
        child: Scaffold(
            backgroundColor: const Color(0xff211951),
            body: Center(
              child: Container(
                height: 120,
                width: 300,
                decoration: BoxDecoration(
                  color: const Color(0xff211951),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Text(
                        'Room Sound Level',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF0F3FF),
                        ),
                      ),
                      SizedBox(
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
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: const Color(0xff615B85),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  '${widget.sound} dB', // This will display the sound level
                                  style: const TextStyle(
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
