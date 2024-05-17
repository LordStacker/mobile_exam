import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/signup/sign_up_bloc.dart';
import '../../services/InputValidatorService.dart';

class NewUser extends StatefulWidget {
  const NewUser({super.key});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final usernameController = TextEditingController(text: "");
  final passwordController = TextEditingController(text: "");
  final emailController = TextEditingController(text: "");
  final _inputValidator = InputValidator();

  @override
  dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocConsumer<SignUpBloc, SignUpState>(listener: (context, state) {
        // This listener listens for state changes and acts accordingly
        switch (state) {
          case Initial():
          // Do nothing
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
          case Error():
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to create user'),
                backgroundColor: Colors.red,
              ),
            );
        }
      }, builder: (context, state) {
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
                                obscureText: true,
                                controller: passwordController,
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
                                controller: emailController,
                                decoration: InputDecoration(
                                  fillColor: Color(0xff211951),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
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
                                final username = usernameController.text;
                                final password = passwordController.text;
                                final email = emailController.text;

                                if (_inputValidator.isValidUsername(username) &&
                                    _inputValidator.isValidPassword(password) &&
                                    _inputValidator.isValidEmail(email)) {
                                  context.read<SignUpBloc>().add(
                                      SignUpEvent.submitted(
                                          username, password, email));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Invalid input'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                'Create User!',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xff15F5BA),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xff15F5BA)),
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
