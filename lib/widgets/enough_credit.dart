import 'package:flutter/material.dart';
import 'package:do_an/screen/play.dart';

class NotEnoughCredit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xff1e6091),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      content: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 20, right: 10, left: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  'KHÔNG ĐỦ CREDIT',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Lalezar',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 5
                      ..color = Colors.white,
                  ),
                ),
                Text(
                  'KHÔNG ĐỦ CREDIT',
                  style: TextStyle(
                      fontFamily: 'Lalezar',
                      fontSize: 20,
                      color: Color(0xff118ab2)),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.cancel,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }, //onPressed,
                        label: Text(
                          "OK",
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
                              MaterialStateProperty.all(Color(0xffff4d6d)),
                        )))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
