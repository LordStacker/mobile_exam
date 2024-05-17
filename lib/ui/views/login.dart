import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/signin/sign_in_bloc.dart';
import '../../services/InputValidatorService.dart';
import 'newuser.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController(text: "Test4");
  final passwordController = TextEditingController(text: "pass1234");
  final _inputValidator = InputValidator();

  @override
  dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Bloc provider to provide the SignInBloc to the widget tree and listen for state changes
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: BlocConsumer<SignInBloc, SignInState>(listener: (context, state) {
        // This listener listens for state changes and acts accordingly
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
            Navigator.pushNamed(context, '/measurements');
          case Error():
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to log in'),
                backgroundColor: Colors.red,
              ),
            );
        }
      }, builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xffF0F3FF),
          appBar: AppBar(
              backgroundColor: Color(0xff211951),
              title: Text('Welcome, please log in'),
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xffF0F3FF),
              )),
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
                                controller: usernameController,
                                decoration: InputDecoration(
                                  fillColor: Color(0xff211951),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
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
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  fillColor: Color(0xff211951),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                final username = usernameController.text;
                                final password = passwordController.text;

                                if (_inputValidator.isValidUsername(username) &&
                                    _inputValidator.isValidPassword(password)) {
                                  context.read<SignInBloc>().add(
                                      SignInEvent.submitted(
                                          username, password));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Invalid username or password'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xff15F5BA),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xff15F5BA)),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewUser()),
                                );
                              },
                              child: Text(
                                'New User?',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff211951),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xff211951)),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            // This is the footer
            color: Color(0xff211951),
            height: 50.0,
            alignment: Alignment.center,
          ),
        );
      }),
    );
  }
}
