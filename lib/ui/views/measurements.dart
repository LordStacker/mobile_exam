import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/measurements/measurements_bloc.dart';
import '../widgets/BottomNavbar.dart';
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
        backgroundColor: const Color(0xffF0F3FF),
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xffF0F3FF)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: const Color(0xff211951),
            title: const Text('Environment Measurements'),
            titleTextStyle: const TextStyle(
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
                              SoundWidget(sound: measurements['SoundLevel']),
                              TemperatureWidget(
                                  temperature: measurements['Temperature']),
                              HumitdityWidget(
                                  humidity: measurements['Humidity']),
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
