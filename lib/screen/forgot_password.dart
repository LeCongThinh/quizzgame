// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_new

import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(251, 255, 191, 74),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            decoration: const BoxDecoration(
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
                              child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      padding: const EdgeInsets.all(0),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              InkWell(
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.arrow_back_outlined,
                                  size: 50,
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ForgotPassword(),
                                  )
                                );
                              },
                              )
                            ],
                          ),
                          Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                              Text(
                                'Quên mật khẩu',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 5
                                    ..color = Colors.white,
                                ),
                              ),
                              const Text(
                                'Quên mật khẩu',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff003049)),
                              ),
                              ],
                            ),
                          
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'images/question.png',
              width: 300,
              height: 300,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'G-mail ',
                border: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: Icon(Icons.mail_outline),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Colors.red,
                minimumSize: Size(250, 60),
                elevation: 12,
                shadowColor: Colors.red,
                side: BorderSide(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Quên mật khẩu'),
                        content: Text('Đã gửi mã về G-mail'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'))
                        ],
                      );
                    });
              },
              child: const Text('Lấy lại mật khẩu',
                  style: TextStyle(fontSize: 28)),
            ),
          ),
        ]),
      );
  }
}
