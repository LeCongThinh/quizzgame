// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:do_an/screen/play.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {super.key,
      required this.result,
      required this.question_lenght,
      required this.playAgain});
  final int result;
  final int question_lenght;
  final VoidCallback playAgain;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xfffcd5ce),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      content: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 30, right: 10, left: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  'ĐÃ HOÀN THÀNH',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Lalezar',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 5
                      ..color = Colors.white,
                  ),
                ),
                Text(
                  'ĐÃ HOÀN THÀNH',
                  style: TextStyle(
                      fontFamily: 'Lalezar',
                      fontSize: 30,
                      color: Color(0xffe63946)),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  'TỔNG ĐIỂM',
                  style: TextStyle(
                    fontSize: 31,
                    fontFamily: 'Lalezar',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 5
                      ..color = Colors.white,
                  ),
                ),
                Text(
                  'TỔNG ĐIỂM',
                  style: TextStyle(
                      fontFamily: 'Lalezar',
                      fontSize: 31,
                      color: Color(0xffe63946)),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              'images/rainbow.gif',
              height: 120,
              width: 200,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              child: Text(
                '$result',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Lalezar',
                ),
              ),
              radius: 55,
              backgroundColor: (result == (question_lenght / 2))
                  ? Colors.yellow
                  : (result < (question_lenght / 2))
                      ? Colors.red
                      : Colors.green,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: ElevatedButton.icon(
                  icon: const Icon(
                    size: 28,
                    Icons.home,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Topic()),
                    );
                  },
                  label: Text(
                    "Trang chủ",
                    style: const TextStyle(
                        fontFamily: 'Lalezar',
                        fontSize: 23,
                        color: Colors.white),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(
                            top: 7, bottom: 6, left: 40, right: 40)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.white,
                              width: 3,
                              style: BorderStyle.solid,
                            ))),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffff4d6d)),
                  ),
                )),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                    child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.refresh,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: playAgain, //onPressed,
                        label: Text(
                          "Chơi lại",
                          style: const TextStyle(
                              fontFamily: 'Lalezar',
                              fontSize: 23,
                              color: Colors.white),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.only(
                                  top: 8, bottom: 3, left: 50, right: 50)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                        color: Colors.white,
                                        width: 3,
                                        style: BorderStyle.solid,
                                      ))),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff4cc9f0)),
                        )))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
