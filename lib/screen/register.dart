// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  var value = true;
  var icon = Ionicons.eye;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(251, 255, 191, 74),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(255, 237, 223, 174),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 5,
                      offset: Offset(
                        0,
                        5,
                      ))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 60,
                  child: Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          'Đăng kí tài khoản',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 5
                              ..color = Colors.white,
                          ),
                        ),
                        Text(
                          'Đăng kí tài khoản',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff003049)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'images/user.png',
              width: 100,
              height: 100,
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 15),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                            child: SizedBox(
                              height: 50,
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xfff9ecc2),
                                    hintText: 'Gmail',
                                    prefixIcon: Icon(
                                          Icons.mail,
                                          color: Color(0xff003049),
                                        ),
                                  ),
                                  style: TextStyle(
                                    fontSize: 17
                                  ),
                                  controller: txtEmail,
                                ),
                              ),
                            ),
                          ),
                        ),
          
          Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: Material(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(30),
                                    child: TextField(
                                      obscureText: value,
                                      textAlignVertical: TextAlignVertical.bottom,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Color(0xfff9ecc2),
                                        hintText: 'Mật khẩu',
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Color(0xff003049),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            icon,
                                            color: Color(0xff003049),
                                          ),
                                          onPressed: () {
                                            if(value == true)
                                              setState(() {
                                                value = false;
                                                icon = Ionicons.eye_off;
                                              });
                                            else
                                              setState(() {
                                                value = true;
                                                icon = Ionicons.eye;
                                              });
                                          },
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontSize: 17
                                      ),
                                      controller: txtPass,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ),
                        ),
          
          Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: Material(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(30),
                                    child: TextField(
                                      obscureText: value,
                                      textAlignVertical: TextAlignVertical.bottom,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Color(0xfff9ecc2),
                                        hintText: 'Xác nhận mật khẩu',
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Color(0xff003049),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            icon,
                                            color: Color(0xff003049),
                                          ),
                                          onPressed: () {
                                            if(value == true)
                                              setState(() {
                                                value = false;
                                                icon = Ionicons.eye_off;
                                              });
                                            else
                                              setState(() {
                                                value = true;
                                                icon = Ionicons.eye;
                                              });
                                          },
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontSize: 17
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ),
                        ),
                            
          Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                  child: Container(
                    margin: EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 1.0],
                        colors: [
                          Color(0xff14ffff),
                          Color(0xffd422fa),
                        ],
                      ),
                      color: Colors.deepPurple.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                        width: 2000,
                        height: 50,
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
                        onPressed: () async{
                          try{                            
                             final newUser = _auth.createUserWithEmailAndPassword(email: txtEmail.text, password: txtPass.text);
                             if(newUser != null){
                               Navigator.pop(context, 'Đăng ký thành công!');
                               //SnackBar(content: Text('email $txtEmail password $txtPass'));
                             } else {
                               final snackBar = SnackBar(content: Text('Tài Khoản Này Không Hợp Lệ'));
                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
                             }
                          } catch (e){
                            final snackBar = SnackBar(content: Text('Có Lỗi Xảy Ra!'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(),
                          child: Text(
                            'Đăng ký',
                            style: TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        )
                        ),
                      ),
                  ),

                ),
          
          
        ]),
      );
  }
}
