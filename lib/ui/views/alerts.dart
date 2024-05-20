import 'package:exam_project/services/NotificationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/alerts/alerts_bloc.dart';
import '../widgets/BottomNavbar.dart';

class Alerts extends StatefulWidget {
  const Alerts({super.key});

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlertsBloc()..add(const AlertsEvent.started()),
      child: Scaffold(
        backgroundColor: Color(0xffF0F3FF),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xffF0F3FF)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Color(0xff211951),
          title: Text('Alerts'),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffF0F3FF),
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBar(),
        body: BlocConsumer<AlertsBloc, AlertsState>(
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

              case Display():
                Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            return switch (state) {
              Initial() || Loading() => Container(),
              Display() => Center(
                  child: ListView.builder(
                    itemCount: NotificationService().getMessages().length,
                    itemBuilder: (context, index) {
                      final message =
                          NotificationService().getMessages().elementAt(index);
                      return Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 5,
                        child: ListTile(
                            title: Text(message.notification?.title ?? ''),
                            subtitle: Text(message.notification?.body ?? ''),
                            tileColor: Color(0xff211951),
                            textColor: Color(0xffF0F3FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      );
                    },
                  ),
                ),
              AlertsState() =>
                const Center(child: Text('Failed to load alerts')),
            };
          },
        ),
      ),
    );
  }
}
