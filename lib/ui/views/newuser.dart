import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewUser extends StatelessWidget {
  const NewUser({super.key});

  @override
  Widget build(BuildContext context) {
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
                            decoration: InputDecoration(
                              fillColor: Color(0xff211951),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),),

                              labelText: 'Monitor Id',
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
                          onPressed: (){print('ass');},
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
