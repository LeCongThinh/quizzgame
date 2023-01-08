// ignore_for_file: unused_import, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:do_an/screen/play.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../prefer.dart';

class Start extends StatefulWidget {
  Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => StartState();
}

class StartState extends State<Start> {
  final number = TextEditingController();

  @override
  void dispose() {
    number.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcbf49),
      body: Center(
          child: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          child: CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage('${Prefer.getPicture()}'),
          ),
        ),

        // Container(
        //   width: 150,
        //   height: 150,
        //   child: Image.asset('images/image_profile.png'),
        // ),

        // SizedBox(height: 32,),
        // CircleAvatar(
        //   radius: 40,
        //   backgroundImage: NetworkImage(user.photoURL!),
        // ),
        // SizedBox(height: 8,),

        Container(
          margin: EdgeInsets.only(top: 15),
          child: Text(
            '${Prefer.getName()}',
            style: TextStyle(
              fontSize: 23,
              color: Colors.red,
              fontFamily: 'Lalezar',
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 15),
          child: Text(
            'Chào mừng bạn',
            style: TextStyle(
              color: Color(0xff003049),
              fontFamily: 'Lalezar',
              fontSize: 35,
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            'đến với trò chơi',
            style: TextStyle(
              color: Color(0xff003049),
              fontSize: 35,
              fontFamily: 'Lalezar',
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            '"Triệu Phú 2022"',
            style: TextStyle(
              color: Color(0xff003049),
              fontSize: 45,
              fontFamily: 'Lalezar',
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 20),
          child: Image.asset(
            'images/hello_green.gif',
            height: 200,
            width: 250,
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
          child: Container(
            margin: EdgeInsets.only(top: 45),
            decoration: BoxDecoration(
              color: Color(0xffd62828),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              width: 2000,
              height: 60,
              child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Topic(),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Text(
                      'Bắt đầu trò chơi',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Lalezar',
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ])),
    );
  }
}
