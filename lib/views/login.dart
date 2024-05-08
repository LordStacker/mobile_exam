import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'newuser.dart';
import '../services/WebSocketService.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';
  String password = '';


  Future<void> signIn() async {
    WebSocketService().signIn(username, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F3FF),
      appBar: AppBar(
        backgroundColor: Color(0xff211951),
        title: Text('Welcome, please log in'),
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
                                borderRadius: BorderRadius.circular(10),),

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
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Color(0xff211951),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),),
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
                          onPressed: (){
                            signIn();
                          },
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff15F5BA),
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xff15F5BA)
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NewUser()),
                            );
                          },
                          child: Text(
                            'New User?',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff211951),
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xff211951)
                            ),
                          ),
                        ),],
                    )]
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
}