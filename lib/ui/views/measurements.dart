import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/measurements/measurements_bloc.dart';
import '../widgets/HumidityWidget.dart';
import '../widgets/SoundWidget.dart';
import '../widgets/TemperatureWidget.dart';

class Measurements extends StatefulWidget {
  const Measurements({super.key});

  @override
  State<Measurements> createState() => _MeasurementsState();
}

class _MeasurementsState extends State<Measurements> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MeasurementsBloc()..initialize(),
      child: Scaffold(
        backgroundColor: Color(0xffF0F3FF),
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xffF0F3FF)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Color(0xff211951),
            title: Text('Environment Measurements'),
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xffF0F3FF),
            )),
        bottomNavigationBar: const AppBottomNavigationBar(),
        body: BlocConsumer<MeasurementsBloc, MeasurementsState>(
          listener: (context, state) {
            switch (state) {
              case Initial():
              // Do nothing for now
              case Loading():
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff15F5BA),
                        ),
                      );
                    });
              case Success():
                Navigator.of(context).pop();
              case Failure():
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Failed to load measurements'),
                    backgroundColor: Colors.red,
                  ),
                );
            }
          },
          builder: (context, state) {
            return switch (state) {
              Initial() || Loading() => Container(),
              Failure() =>
                const Center(child: Text('Failed to load measurements')),
              Success(:final measurements) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 450,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SoundWidget(sound: measurements['sound_level']),
                              TemperatureWidget(
                                  temperature: measurements['temperature']),
                              HumitdityWidget(
                                  humidity: measurements['humidity']),
                            ]),
                      ),
                    ],
                  ),
                ),
            };
          },
        ),
      ),
    );
  }
}

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
