// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, duplicate_ignore, sort_child_properties_last

import 'package:ionicons/ionicons.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'google_login.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});
  @override
  State<LogIn> createState() => LogInState();
}

class LogInState extends State<LogIn> {
  var value = true;
  var icon = Ionicons.eye;

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfffcbf49),
      body: Container(
        /*  
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/space03.jpg"),
              fit: BoxFit.cover,
            ),
          ),
*/
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color(0xfff3d07f),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 5,
                        offset: Offset(
                          0,
                          5,
                        ),
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 65,
                      child: Container(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              'TRIỆU PHÚ 2022',
                              style: TextStyle(
                                fontSize: 38,
                                fontFamily: 'Lalezar',
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 6
                                  ..color = Colors.white,
                              ),
                            ),
                            Text(
                              'TRIỆU PHÚ 2022',
                              style: TextStyle(
                                  fontFamily: 'Lalezar',
                                  fontSize: 38,
                                  color: Color(0xff003049)),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Stack(
                  children: [
                    Text(
                      'Đăng Nhập',
                      style: TextStyle(
                        fontFamily: 'Lalezar',
                        fontSize: 53,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.white,
                      ),
                    ),
                    Text(
                      'Đăng Nhập',
                      style: TextStyle(
                        fontFamily: 'Lalezar',
                        fontSize: 53,
                        color: Color(0xff003049),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Image.asset(
                  'images/green_happy.gif',
                  height: 150,
                  width: 250,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    // ignore: prefer_const_constructors
                    Text(
                      'Đăng nhập tài khoản thông qua',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          color: Color.fromARGB(255, 6, 99, 148),
                          fontSize: 23,
                          fontFamily: 'Lalezar'),
                    ),
                    Text(
                      'tài khoản Google',
                      style: TextStyle(
                          color: Color.fromARGB(255, 6, 99, 148),
                          fontSize: 23,
                          fontFamily: 'Lalezar'),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: RoundedLoadingButton(
                  child: Icon(Ionicons.logo_google),
                  successIcon: Icons.circle,
                  color: Colors.redAccent,
                  controller: _btnController,
                  onPressed: () async {
                    GoogleLogin().LogIn(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
