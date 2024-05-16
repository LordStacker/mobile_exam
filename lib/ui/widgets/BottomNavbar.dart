import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // This is the footer
      color: Color(0xff211951),
      height: 63.0,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/measurements');
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
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/settings');
            },
            child: SvgPicture.asset(
              'assets/svgs/Settings.svg',
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
