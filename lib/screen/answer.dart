import 'dart:async';
import 'package:do_an/models/data_user.dart';
import 'package:do_an/models/load_data.dart';
import 'package:quiver/pattern.dart';
import 'dart:math';
import 'package:do_an/widgets/result_box.dart';
import 'package:do_an/widgets/time_out.dart';
import 'package:flutter/material.dart';
import '../prefer.dart';
import '../widgets/enough_credit.dart';
import '../widgets/propose.dart';

class Answer extends StatefulWidget {
  List<Question> data;

  String chude;
  Answer({
    Key? key,
    required this.data,
    required this.chude,
  }) : super(key: key);

  @override
  State<Answer> createState() => AnswerState();
}

class AnswerState extends State<Answer> {
  late int _current;
  late Timer _time;
  int current_index = 0;
  String selectAnswer = '';
  int diem = 0;
  String? chude;
  bool half = true, call = true, change = true, buy = true;
  var colorHalf = Color(0xfff3d07f),
      colorCall = Color(0xfff3d07f),
      colorChange = Color(0xfff3d07f);
  var temp;

  void NextQuestion() {
    Future.delayed(Duration(milliseconds: 200), () {
      if (current_index == 14) {
        _time.cancel();

        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (ctx) {
              return ResultBox(
                result: diem,
                question_lenght: questions.length,
                playAgain: startAgain,
              );
            });
        DataUser.UploadPoint(diem);
        DataUser.HistoryPlay(chude!, diem);
      }

      setState(() {
        if (current_index == 14) return;
        current_index++;
        selectAnswer = '';
        _current = 20;
      });
    });
  }
  // int diem = 0;

  // void startTimer() {
  //   CountdownTimer countDownTimer = new CountdownTimer(
  //     new Duration(seconds: _start),
  //     new Duration(seconds: 1),
  //   );

  //   var sub = countDownTimer.listen(null);
  //   sub.onData((duration) {
  //
  //   });

  //   sub.onDone(() {
  //     sub.cancel();
  //   });
  // }

  List<Question> questions = [];

  void _LoadQuestion() async {
    //var data = await Question.GetAll(id_chude!);
    setState(() {});
    questions = widget.data;
  }

  @override
  void initState() {
    super.initState();
    chude = this.widget.chude;
    _LoadQuestion();
    temp = -1;

    _current = 20;
    _time = Timer.periodic(Duration(seconds: 1), (timer) {
      print(_current);
      setState(() {
        _current -= 1;
      });
      if (_current == 0) {
        _time.cancel();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (ctx) {
              return TimeOutBox(
                result: diem,
                question_lenght: questions.length,
                playAgain: startAgain,
              );
            });
      }
    });
  }

  void startAgain() {
    _current = 20;
    _time = Timer.periodic(Duration(seconds: 1), (timer) {
      print(_current);
      setState(() {
        _current -= 1;
      });
      if (_current == 0) {
        _time.cancel();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (ctx) {
              return TimeOutBox(
                result: diem,
                question_lenght: questions.length,
                playAgain: startAgain,
              );
            });
      }
    });
    setState(() {
      current_index = 0;
      selectAnswer = '';
      diem = 0;
    });
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Question current_question = questions[current_index];

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfffcbf49),
        body: Column(children: [
          Visibility(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //Ảnh username
                    // Container(
                    //   width: 100,
                    //   height: 100,
                    //   child: Image.asset('images/image_profile.png'),
                    // ),

                    Container(
                      padding: EdgeInsets.all(9),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage('${Prefer.getPicture()}'),
                      ),
                    ),

                    //Tên username
                    Container(
                      margin: EdgeInsets.only(right: 2, left: 2),
                      child: Text(
                        '${Prefer.getName()}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontFamily: 'Lalezar',
                        ),
                      ),
                    ),
                  ],
                ),

                //Ảnh credit
                Container(
                  margin: EdgeInsets.only(right: 18),
                  child: Row(
                    children: [
                      InkWell(
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('images/dollar.png'),
                        ),
                      ),

                      //Số credit
                      Container(
                        child: Text(
                          '${Prefer.getCredit()}',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Lalezar',
                              color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3,
          ),
          SizedBox(
            width: 330,
            height: 25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                    color: Colors.green,
                    value: _current / 20,
                  ),
                  Center(
                    child: Text(
                      _current.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Số câu',
                      style: TextStyle(fontSize: 25, color: Color(0xff032f4c)),
                    ),
                    Text(
                      '${current_index + 1}/15',
                      style: TextStyle(fontSize: 25, color: Color(0xff032f4c)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Điểm',
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    ),
                    Text(
                      '$diem',
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 15, right: 15),
            height: 120,
            width: 6000,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: //Text('${Question.question}'),

                Text(
              '${current_question.question}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontFamily: 'Lalezar',),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: (selectAnswer == current_question.answer[0] &&
                          current_question.answer[0] ==
                              current_question.option_true)
                      ? Colors.green
                      : (selectAnswer == current_question.answer[0] &&
                              current_question.answer[0] !=
                                  current_question.option_true)
                          ? Colors.red
                          : null,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        selectAnswer = current_question.answer[0];
                      });
                      NextQuestion();
                      if (current_question.answer[0] ==
                          current_question.option_true) {
                        diem += 10;
                      }
                    },
                    title: Text(
                      '${current_question.answer[0]}',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Lalezar',
                      ),
                    ),
                  ),
                ),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: (selectAnswer == current_question.answer[1] &&
                          current_question.answer[1] ==
                              current_question.option_true)
                      ? Colors.green
                      : (selectAnswer == current_question.answer[1] &&
                              current_question.answer[1] !=
                                  current_question.option_true)
                          ? Colors.red
                          : null,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        selectAnswer = current_question.answer[1];
                      });
                      NextQuestion();
                      if (current_question.answer[1] ==
                          current_question.option_true) {
                        diem += 10;
                      }
                    },
                    title: Text(
                      '${current_question.answer[1]}',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Lalezar',
                      ),
                    ),
                  ),
                ),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: (selectAnswer == current_question.answer[2] &&
                          current_question.answer[2] ==
                              current_question.option_true)
                      ? Colors.green
                      : (selectAnswer == current_question.answer[2] &&
                              current_question.answer[2] !=
                                  current_question.option_true)
                          ? Colors.red
                          : null,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        selectAnswer = current_question.answer[2];
                      });
                      NextQuestion();
                      if (current_question.answer[2] ==
                          current_question.option_true) {
                        diem += 10;
                      }
                    },
                    title: Text(
                      '${current_question.answer[2]}',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Lalezar',
                      ),
                    ),
                  ),
                ),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: (selectAnswer == current_question.answer[3] &&
                          current_question.answer[3] ==
                              current_question.option_true)
                      ? Colors.green
                      : (selectAnswer == current_question.answer[3] &&
                              current_question.answer[3] !=
                                  current_question.option_true)
                          ? Colors.red
                          : null,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        selectAnswer = current_question.answer[3];
                      });
                      NextQuestion();
                      if (current_question.answer[3] ==
                          current_question.option_true) {
                        diem += 10;
                      }
                    },
                    title: Text(
                      '${current_question.answer[3]}',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Lalezar',
                      ),
                    ),
                  ),
                ),

                // Card(
                //   margin: EdgeInsets.only(top: 8, left: 15, right: 15),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20),
                //   ),

                //child:

                // ListTile(
                //   onTap: () {
                //     setState(() {
                //       current_index++;
                //     });
                //   },
                //   title: Text(
                //     '${Question.answer}',
                //   ),
                // ),
                // color: (selectAnswer == answers &&
                //         answers == current_question.correct_answer)
                //     ? Colors.green
                //     : (selectAnswer == answers &&
                //             answers != current_question.correct_answer)
                //         ? Colors.red
                //         : null,
                // child: ListTile(
                //   onTap: () {
                //     setState(() {
                //       selectAnswer = answers;
                //     });
                //     if (answers == current_question.correct_answer) {
                //       diem += 10;
                //     }
                //     NextQuestion();
                //   },
                //   title: Text(
                //     answers,
                //     style: TextStyle(
                //       color: selectAnswer == answers
                //           ? Colors.white
                //           : Colors.black,
                //       fontSize: 20,
                //     ),
                //   ),
                // ),
                // )

                // child: ListView.builder(
                //   itemBuilder: (context, index) {
                //     final answers = current_question.answer[index];
                //     return Card(
                //       margin: EdgeInsets.only(top: 8, left: 15, right: 15),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       color: (selectAnswer == answers &&
                //               answers == current_question.correct_answer)
                //           ? Colors.green
                //           : (selectAnswer == answers &&
                //                   answers != current_question.correct_answer)
                //               ? Colors.red
                //               : null,
                //       child: ListTile(
                //         onTap: () {
                //           setState(() {
                //             selectAnswer = answers;
                //           });
                //           if (answers == current_question.correct_answer) {
                //             diem += 10;
                //           }
                //           NextQuestion();
                //         },
                //         title: Text(
                //           answers,
                //           style: TextStyle(
                //             color: selectAnswer == answers
                //                 ? Colors.white
                //                 : Colors.black,
                //             fontSize: 20,
                //           ),
                //         ),
                //       ),
                //     );
                //   },
                //   itemCount: current_question.answer.length,
                // ),
                Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Divider(
                        color: Colors.black,
                        thickness: 2,
                        indent: 25,
                        endIndent: 25,
                      )),
                      Text(
                        "Quyền trợ giúp",
                        style: TextStyle(fontSize: 17),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.black,
                        thickness: 2,
                        indent: 25,
                        endIndent: 25,
                      )),
                    ])),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: colorHalf,
                            borderRadius: BorderRadius.circular(15)),
                        child: IconButton(
                          icon: Image.asset('images/percent50.png'),
                          iconSize: 50,
                          onPressed: () {
                            if (half) {
                              int dem = 1;
                              for (var i = 0; i < 4; i++) {
                                if (current_question.answer[i] !=
                                        current_question.option_true &&
                                    dem < 3) {
                                  setState(() {
                                    current_question.answer[i] = "";
                                    half = false;
                                    colorHalf = Colors.grey;
                                    temp = current_index;
                                  });
                                  dem++;
                                }
                              }
                            } else {
                              if (int.parse(Prefer.getCredit()) < 300) {
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (ctx) {
                                      return NotEnoughCredit();
                                    });
                                return;
                              }
                              if (temp != current_index && buy) {
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        backgroundColor: Color(0xff1e6091),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        content: Padding(
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 20,
                                              right: 10,
                                              left: 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Text(
                                                    'BẠN CÓ MUỐN MUA',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: 'Lalezar',
                                                      foreground: Paint()
                                                        ..style =
                                                            PaintingStyle.stroke
                                                        ..strokeWidth = 5
                                                        ..color = Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'BẠN CÓ MUỐN MUA',
                                                    style: TextStyle(
                                                        fontFamily: 'Lalezar',
                                                        fontSize: 20,
                                                        color:
                                                            Color(0xff118ab2)),
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
                                                    '50/50',
                                                    style: TextStyle(
                                                      fontSize: 31,
                                                      fontFamily: 'Lalezar',
                                                      foreground: Paint()
                                                        ..style =
                                                            PaintingStyle.stroke
                                                        ..strokeWidth = 5
                                                        ..color = Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    '50/50',
                                                    style: TextStyle(
                                                        fontFamily: 'Lalezar',
                                                        fontSize: 31,
                                                        color:
                                                            Color(0xff118ab2)),
                                                  )
                                                ],
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      child:
                                                          ElevatedButton.icon(
                                                    icon: const Icon(
                                                      size: 28,
                                                      Icons.check,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        half = true;
                                                        buy = false;
                                                        colorHalf =
                                                            Color(0xfff3d07f);
                                                        Prefer.setCredit(
                                                            credit: (int.parse(
                                                                        Prefer
                                                                            .getCredit()) -
                                                                    300)
                                                                .toString());
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    label: Text(
                                                      "Có (-300)",
                                                      style: const TextStyle(
                                                          fontFamily: 'Lalezar',
                                                          fontSize: 23,
                                                          color: Colors.white),
                                                    ),
                                                    style: ButtonStyle(
                                                      padding: MaterialStateProperty
                                                          .all<EdgeInsets>(
                                                              EdgeInsets.only(
                                                                  top: 7,
                                                                  bottom: 6,
                                                                  left: 40,
                                                                  right: 40)),
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              side: BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 3,
                                                                style:
                                                                    BorderStyle
                                                                        .solid,
                                                              ))),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Color(
                                                                  0xff4cc9f0)),
                                                    ),
                                                  )),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  GestureDetector(
                                                      child:
                                                          ElevatedButton.icon(
                                                              icon: const Icon(
                                                                Icons.cancel,
                                                                size: 30,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              }, //onPressed,
                                                              label: Text(
                                                                "Không",
                                                                style: const TextStyle(
                                                                    fontFamily:
                                                                        'Lalezar',
                                                                    fontSize:
                                                                        23,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              style:
                                                                  ButtonStyle(
                                                                padding: MaterialStateProperty.all<
                                                                        EdgeInsets>(
                                                                    EdgeInsets.only(
                                                                        top: 8,
                                                                        bottom:
                                                                            3,
                                                                        left:
                                                                            50,
                                                                        right:
                                                                            50)),
                                                                shape: MaterialStateProperty.all<
                                                                        RoundedRectangleBorder>(
                                                                    RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                15),
                                                                        side:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.white,
                                                                          width:
                                                                              3,
                                                                          style:
                                                                              BorderStyle.solid,
                                                                        ))),
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all(Color(
                                                                            0xffff4d6d)),
                                                              )))
                                                ],
                                              )),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }
                            }
                           
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: colorCall,
                            borderRadius: BorderRadius.circular(15)),
                        child: IconButton(
                          icon: Image.asset('images/phone_call.png'),
                          iconSize: 50,
                          onPressed: () {
                            if (call) {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (ctx) {
                                    return Propose(
                                        answer: current_question.option_true
                                            .toString());
                                  });
                              setState(() {
                                call = false;
                                colorCall = Colors.grey;
                                temp = current_index;
                              });
                            } else {
                              if (int.parse(Prefer.getCredit()) < 600) {
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (ctx) {
                                      return NotEnoughCredit();
                                    });
                                return;
                              }
                              if (temp != current_index && buy) {
                                // setState(() {
                                //   _time.cancel();
                                // });
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        backgroundColor: Color(0xff1e6091),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        content: Padding(
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 20,
                                              right: 10,
                                              left: 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Text(
                                                    'BẠN CÓ MUỐN MUA',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: 'Lalezar',
                                                      foreground: Paint()
                                                        ..style =
                                                            PaintingStyle.stroke
                                                        ..strokeWidth = 5
                                                        ..color = Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'BẠN CÓ MUỐN MUA',
                                                    style: TextStyle(
                                                        fontFamily: 'Lalezar',
                                                        fontSize: 20,
                                                        color:
                                                            Color(0xff118ab2)),
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
                                                    'GỢI Ý ĐÁP ÁN',
                                                    style: TextStyle(
                                                      fontSize: 31,
                                                      fontFamily: 'Lalezar',
                                                      foreground: Paint()
                                                        ..style =
                                                            PaintingStyle.stroke
                                                        ..strokeWidth = 5
                                                        ..color = Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'GỢI Ý ĐÁP ÁN',
                                                    style: TextStyle(
                                                        fontFamily: 'Lalezar',
                                                        fontSize: 31,
                                                        color:
                                                            Color(0xff118ab2)),
                                                  )
                                                ],
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      child:
                                                          ElevatedButton.icon(
                                                    icon: const Icon(
                                                      size: 28,
                                                      Icons.check,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        call = true;
                                                        buy = false;
                                                        colorCall =
                                                            Color(0xfff3d07f);
                                                        Prefer.setCredit(
                                                            credit: (int.parse(
                                                                        Prefer
                                                                            .getCredit()) -
                                                                    600)
                                                                .toString());
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    label: Text(
                                                      "Có (-600)",
                                                      style: const TextStyle(
                                                          fontFamily: 'Lalezar',
                                                          fontSize: 23,
                                                          color: Colors.white),
                                                    ),
                                                    style: ButtonStyle(
                                                      padding: MaterialStateProperty
                                                          .all<EdgeInsets>(
                                                              EdgeInsets.only(
                                                                  top: 7,
                                                                  bottom: 6,
                                                                  left: 40,
                                                                  right: 40)),
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              side: BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 3,
                                                                style:
                                                                    BorderStyle
                                                                        .solid,
                                                              ))),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Color(
                                                                  0xff4cc9f0)),
                                                    ),
                                                  )),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  GestureDetector(
                                                      child:
                                                          ElevatedButton.icon(
                                                              icon: const Icon(
                                                                Icons.cancel,
                                                                size: 30,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              }, //onPressed,
                                                              label: Text(
                                                                "Không",
                                                                style: const TextStyle(
                                                                    fontFamily:
                                                                        'Lalezar',
                                                                    fontSize:
                                                                        23,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              style:
                                                                  ButtonStyle(
                                                                padding: MaterialStateProperty.all<
                                                                        EdgeInsets>(
                                                                    EdgeInsets.only(
                                                                        top: 8,
                                                                        bottom:
                                                                            3,
                                                                        left:
                                                                            50,
                                                                        right:
                                                                            50)),
                                                                shape: MaterialStateProperty.all<
                                                                        RoundedRectangleBorder>(
                                                                    RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                15),
                                                                        side:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.white,
                                                                          width:
                                                                              3,
                                                                          style:
                                                                              BorderStyle.solid,
                                                                        ))),
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all(Color(
                                                                            0xffff4d6d)),
                                                              )))
                                                ],
                                              )),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }
                            }
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: colorChange,
                            borderRadius: BorderRadius.circular(15)),
                        child: IconButton(
                          icon: Image.asset('images/skip.png'),
                          iconSize: 50,
                          onPressed: () {
                            if (change) {
                              setState(() {
                                if (current_index == 14) return;
                                current_index++;
                                selectAnswer = '';
                                _current = 20;
                                change = false;
                                colorChange = Colors.grey;
                                temp = current_index;
                              });
                            } else {
                              if (int.parse(Prefer.getCredit()) < 900) {
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (ctx) {
                                      return NotEnoughCredit();
                                    });
                                return;
                              }
                              if (temp != current_index && buy) {
                                // setState(() {
                                //   _time.cancel();
                                // });
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        backgroundColor: Color(0xff1e6091),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        content: Padding(
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 20,
                                              right: 10,
                                              left: 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Text(
                                                    'BẠN CÓ MUỐN MUA',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: 'Lalezar',
                                                      foreground: Paint()
                                                        ..style =
                                                            PaintingStyle.stroke
                                                        ..strokeWidth = 5
                                                        ..color = Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'BẠN CÓ MUỐN MUA',
                                                    style: TextStyle(
                                                        fontFamily: 'Lalezar',
                                                        fontSize: 20,
                                                        color:
                                                            Color(0xff118ab2)),
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
                                                    'BỎ QUA CÂU HỎI',
                                                    style: TextStyle(
                                                      fontSize: 31,
                                                      fontFamily: 'Lalezar',
                                                      foreground: Paint()
                                                        ..style =
                                                            PaintingStyle.stroke
                                                        ..strokeWidth = 5
                                                        ..color = Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'BỎ QUA CÂU HỎI',
                                                    style: TextStyle(
                                                        fontFamily: 'Lalezar',
                                                        fontSize: 31,
                                                        color:
                                                            Color(0xff118ab2)),
                                                  )
                                                ],
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      child:
                                                          ElevatedButton.icon(
                                                    icon: const Icon(
                                                      size: 28,
                                                      Icons.check,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        change = true;
                                                        buy = false;
                                                        colorChange =
                                                            Color(0xfff3d07f);
                                                        Prefer.setCredit(
                                                            credit: (int.parse(
                                                                        Prefer
                                                                            .getCredit()) -
                                                                    900)
                                                                .toString());
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    label: Text(
                                                      "Có (-900)",
                                                      style: const TextStyle(
                                                          fontFamily: 'Lalezar',
                                                          fontSize: 23,
                                                          color: Colors.white),
                                                    ),
                                                    style: ButtonStyle(
                                                      padding: MaterialStateProperty
                                                          .all<EdgeInsets>(
                                                              EdgeInsets.only(
                                                                  top: 7,
                                                                  bottom: 6,
                                                                  left: 40,
                                                                  right: 40)),
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              side: BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 3,
                                                                style:
                                                                    BorderStyle
                                                                        .solid,
                                                              ))),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Color(
                                                                  0xff4cc9f0)),
                                                    ),
                                                  )),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  GestureDetector(
                                                      child:
                                                          ElevatedButton.icon(
                                                              icon: const Icon(
                                                                Icons.cancel,
                                                                size: 30,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              }, //onPressed,
                                                              label: Text(
                                                                "Không",
                                                                style: const TextStyle(
                                                                    fontFamily:
                                                                        'Lalezar',
                                                                    fontSize:
                                                                        23,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              style:
                                                                  ButtonStyle(
                                                                padding: MaterialStateProperty.all<
                                                                        EdgeInsets>(
                                                                    EdgeInsets.only(
                                                                        top: 8,
                                                                        bottom:
                                                                            3,
                                                                        left:
                                                                            50,
                                                                        right:
                                                                            50)),
                                                                shape: MaterialStateProperty.all<
                                                                        RoundedRectangleBorder>(
                                                                    RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                15),
                                                                        side:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.white,
                                                                          width:
                                                                              3,
                                                                          style:
                                                                              BorderStyle.solid,
                                                                        ))),
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all(Color(
                                                                            0xffff4d6d)),
                                                              )))
                                                ],
                                              )),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
