import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/SoundWidget.dart';
import '../widgets/TemperatureWidget.dart';
import '../widgets/HumidityWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/measurements/measurements_bloc.dart';


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
        child: BlocConsumer<MeasurementsBloc, MeasurementsState>(
          listener: (context, state) {
            state.map(
              initial: (_) {
                print('Initial state');
                return Container();
              },
              loading: (_) {
                print('Loading state');
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Center(
                      child: CircularProgressIndicator(color: Color(0xff15F5BA),),
                    );
                  },
                );
              },
              success: (successState) {
              print('Success state');
              Navigator.of(context).pop();

            },
              failure: (_) {
                print('Failure state');
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Failed to load measurements'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return state.map(
              initial: (_) {
                print('Builder: Initial state');
                return Container();
              },
              loading: (_) {
                print('Builder: Loading state');
                return Container();
              },
              success: (successState) {
                print('Builder: Success state');
                return
                Scaffold(

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 450,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SoundWidget(sound: successState.measurements['sound_level']),
                              TemperatureWidget(temperature: successState.measurements['temperature']),
                              HumitdityWidget(humidity: successState.measurements['humidity']),
                            ]
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: Container( // This is the footer
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
                    )

                ),
              );
            },
              failure: (_) {
                print('Builder: Failure state');
                return Center(child: Text('Failed to load measurements'));},
            );          },
        ),
    );

  }
}
