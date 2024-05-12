import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../bloc/signup/sign_up_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewUser extends StatefulWidget {
  const NewUser({super.key});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  String username = '';
  String password = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context,
              state) { // This listener listens for state changes and acts accordingly
            state.map(
              initial: (_) {},
              loading: (_) {
                // Show loading icon over entire screen
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff15F5BA),),
                    );
                  },
                );
              },
              success: (_) {
                // Navigate to the next page
                Navigator.pushReplacementNamed(context, '/login');
              },
              failure: (_) {
                // Close the loading icon
                Navigator.of(context).pop();
                // Show an error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Creating user failed'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Color(0xffF0F3FF),
              appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Color(0xffF0F3FF)),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  backgroundColor: Color(0xff211951),
                  title: Text('Create a new account'),
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
                      height: 300,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/svgs/user.svg',
                                  width: 50,
                                  height: 50,
                                ),
                                Container(
                                  width: 150,
                                  height: 50,
                                  child: TextField(
                                    onChanged: (String value) {
                                      username = value;
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Color(0xff211951),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            10),),

                                      labelText: 'Username',
                                      labelStyle: TextStyle(
                                        color: Color(0xffF0F3FF),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: Color(0xffF0F3FF),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/svgs/Pacifier.svg',
                                  width: 50,
                                  height: 50,
                                ),
                                Container(
                                  width: 150,
                                  height: 50,
                                  child: TextField(
                                    onChanged: (String value) {
                                      password = value;
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Color(0xff211951),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            10),),

                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                        color: Color(0xffF0F3FF),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: Color(0xffF0F3FF),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/svgs/Monitor.svg',
                                  width: 50,
                                  height: 50,
                                ),
                                Container(
                                  width: 150,
                                  height: 50,
                                  child: TextField(
                                    onChanged: (String value) {
                                      email = value;
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Color(0xff211951),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            10),),

                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                        color: Color(0xffF0F3FF),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: Color(0xffF0F3FF),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    BlocProvider.of<SignUpBloc>(context).add(
                                      SignUpEvent.submitted(
                                          username, password, email
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Create User!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Color(0xff15F5BA),
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color(0xff15F5BA)
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ]
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Container( // This is the footer
                color: Color(0xff211951),
                height: 50.0,
                alignment: Alignment.center,

              ),
            );
          }
      ),
    );
  }
}
