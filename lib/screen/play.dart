// ignore_for_file: prefer_final_fields, sort_child_properties_last, use_build_context_synchronously, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_null_comparison, prefer_is_empty

import 'package:do_an/screen/data/data_rank.dart';
import 'package:do_an/screen/infor.dart';
import 'package:do_an/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:do_an/screen/answer.dart';

import '../models/load_data.dart';
import '../prefer.dart';
import 'data/data_history.dart';
import 'data/data_nap.dart';

class Topic extends StatefulWidget {
  const Topic({Key? key}) : super(key: key);

  @override
  State<Topic> createState() => TopicState();
}

class TopicState extends State<Topic> {
  bool username = true;
  bool rankings = false;
  bool settings = false;
  bool topics = true;
  bool status = true;
  bool divider = true;
  bool history = false;
  bool credit = false;
  var colorRanking = Colors.transparent;
  var colorPlaying = const Color(0xfff1a649);
  var colorSetting = Colors.transparent;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfffcbf49),
      body: Center(
        child: Column(
          children: [
            //Phần ảnh và tên username và credit
            //Start
            Visibility(
              visible: username,
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
                        padding: const EdgeInsets.all(9),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              NetworkImage('${Prefer.getPicture()}'),
                        ),
                      ),

                      //Tên username
                      Container(
                        margin: const EdgeInsets.only(right: 2, left: 2),
                        child: Text(
                          '${Prefer.getName()}',
                          style: const TextStyle(
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
                    margin: const EdgeInsets.only(right: 18),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (() {
                            setState(() {
                              rankings = false;
                              topics = false;
                              settings = false;
                              username = false;
                              divider = false;
                              history = false;
                              credit = true;
                              colorRanking = Colors.transparent;
                              colorPlaying = Colors.transparent;
                              colorSetting = Colors.transparent;
                            });
                          }),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset('images/dollar.png'),
                          ),
                        ),

                        //Số credit
                        Text(
                          '${Prefer.getCredit()}',
                          style: const TextStyle(
                              fontSize: 25,
                              fontFamily: 'Lalezar',
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Kết thúc phần ảnh và tên username và credit

            Visibility(
              visible: divider,
              child: Container(
                  margin: const EdgeInsets.only(top: 1),
                  child: Row(children: const <Widget>[
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                      thickness: 2,
                      indent: 25,
                      endIndent: 25,
                    ))
                  ])),
            ),

            //Phần giao diện chọn chủ đề
            //Start
            Visibility(
              visible: topics,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 17),
                    child: const Text(
                      'Chọn chủ đề',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 35,
                        fontFamily: 'Lalezar',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            child: Container(
                              margin: const EdgeInsets.only(top: 5),
                              width: 150,
                              height: 100,
                              //child: images/play_game.jpg,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('images/play_game.jpg'),
                                ),
                                border:
                                    Border.all(color: Colors.white, width: 5),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(18)),
                                color: Colors.grey.shade300,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(137, 103, 101, 101),
                                    blurRadius: 5,
                                    offset: Offset(
                                      0,
                                      5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () async {
                              var data = await Question.GetAll(1);
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Answer(chude: 'Game', data: data),
                                  ));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          Container(
                            // ignore: prefer_const_constructors
                            margin: EdgeInsets.only(top: 10),
                            child: const Text(
                              'Game',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Lalezar',
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              margin: const EdgeInsets.only(top: 5),
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage('images/music.jpg'),
                                ),
                                border:
                                    Border.all(color: Colors.white, width: 5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                color: Colors.grey.shade300,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(137, 103, 101, 101),
                                    blurRadius: 5,
                                    offset: Offset(
                                      0,
                                      5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => Answer(
                              //         questions: qstion,
                              //       ),
                              //     ));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              'Âm nhạc',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Lalezar',
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage('images/culture.jpg'),
                                ),
                                border:
                                    Border.all(color: Colors.white, width: 5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                color: Colors.grey.shade300,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(137, 103, 101, 101),
                                    blurRadius: 5,
                                    offset: Offset(
                                      0,
                                      5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           Answer(questions: qstion),
                              //     ));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              'Văn hóa',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Lalezar',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage('images/sport.jpg'),
                                ),
                                border:
                                    Border.all(color: Colors.white, width: 5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                color: Colors.grey.shade300,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(137, 103, 101, 101),
                                    blurRadius: 5,
                                    offset: Offset(
                                      0,
                                      5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () async {
                              var data = await Question.GetAll(2);
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Answer(chude: 'Bóng đá', data: data),
                                  ));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              'Bóng đá',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Lalezar',
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage('images/film.jpg'),
                                ),
                                border:
                                    Border.all(color: Colors.white, width: 5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                color: Colors.grey.shade300,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(137, 103, 101, 101),
                                    blurRadius: 5,
                                    offset: Offset(
                                      0,
                                      5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           Answer(questions: qstion),
                              //     ));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              'Phim ảnh',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Lalezar',
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      const AssetImage('images/synthesise.jpg'),
                                ),
                                border:
                                    Border.all(color: Colors.white, width: 5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                color: Colors.grey.shade300,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(137, 103, 101, 101),
                                    blurRadius: 5,
                                    offset: Offset(
                                      0,
                                      5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           Answer(questions: qstion),
                              //     ));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              'Tổng hợp',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Lalezar',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Kết thúc phần giao diện chọn chủ đề

            //Phần giao diện cài đặt
            //Start
            Visibility(
              visible: settings,
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                      height: 60,
                      width: 5000,
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Icon(
                                Icons.history,
                                size: 35,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 7, left: 15),
                              child: Text(
                                'Lịch sử chơi',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Lalezar',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onTap: () {
                      setState(() {
                        history = true;
                        settings = false;
                      });
                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                      height: 60,
                      width: 5000,
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Icon(
                                Icons.logout,
                                size: 35,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 7, left: 15),
                              child: Text(
                                'Đăng xuất',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Lalezar',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onTap: () {
                      //Prefer.removeAll();
                      Prefer.removeMail();

                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LogIn(),
                          ));
                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                      height: 60,
                      width: 5000,
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Icon(
                                Icons.info,
                                size: 35,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 7, left: 15),
                              child: Text(
                                'Thông tin tài khoản',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Lalezar',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountInformation(),
                          ));
                    },
                  ),
                ],
              ),
            ),

            //Phần giao diện xếp hạng
            //Start
            Visibility(
              visible: rankings,
              child: Column(
                children: [
                  Container(
                    height: 80,
                    padding: EdgeInsets.only(left: 38, right: 38),
                    decoration: BoxDecoration(
                        color: Color(0xfffce444),
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.only(top: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          'BẢNG XẾP HẠNG',
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Lalezar',
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 10
                              ..color = Colors.white,
                          ),
                        ),
                        Text(
                          'BẢNG XẾP HẠNG',
                          style: TextStyle(
                              fontFamily: 'Lalezar',
                              fontSize: 40,
                              color: Color(0xffdf2322)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 29),
                            child: Row(
                              children: [
                                Text(
                                  'Hạng',
                                  style: TextStyle(
                                    color: Color(0xff003049),
                                    fontSize: 30,
                                    fontFamily: 'Lalezar',
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  child: Text(
                                    'Tên',
                                    style: TextStyle(
                                      color: Color(0xff003049),
                                      fontSize: 30,
                                      fontFamily: 'Lalezar',
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(right: 29),
                          child: Text(
                            'Điểm',
                            style: TextStyle(
                              color: Color(0xff003049),
                              fontSize: 30,
                              fontFamily: 'Lalezar',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      child: Row(children: <Widget>[
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                      thickness: 2,
                      indent: 25,
                      endIndent: 25,
                    ))
                  ])),
                  Container(
                    color: Colors.green,
                    width: size.width,
                    height: size.height * .68,
                    child: ListView.builder(
                        itemCount: UserData.lsData.length,
                        itemBuilder: ((context, index) {
                          List<UserModel> data = UserData.lsData;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: size.height * .2,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                      left: 10,
                                      top: 20,
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                              data[index].img,
                                            )),
                                            shape: BoxShape.circle),
                                      )),
                                  Positioned(
                                      top: 20,
                                      child: Container(
                                          width: size.width,
                                          height: 24,
                                          child: Center(
                                            child: Text(
                                              data[index].name,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                fontFamily: 'Lalezar',
                                              ),
                                            ),
                                          ))),
                                  Positioned(
                                      top: 20,
                                      right: 10,
                                      child: Container(
                                          child: Center(
                                        child: Text(
                                          data[index].score.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            fontFamily: 'Lalezar',
                                          ),
                                        ),
                                      ))),
                                  Positioned(
                                      bottom: 20,
                                      right: 10,
                                      child: Container(
                                          child: Center(
                                        child: Text(
                                          data[index].mail.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            fontFamily: 'Lalezar',
                                          ),
                                        ),
                                      ))),
                                ],
                              ),
                            ),
                          );
                        })),
                  )
                ],
              ),
            ),

            Visibility(
                visible: history,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            'Lịch sử',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color = Colors.white,
                              fontFamily: 'Lalezar',
                            ),
                          ),
                          Text(
                            'Lịch sử',
                            style: TextStyle(
                                fontFamily: 'Lalezar',
                                fontSize: 40,
                                color: Color(0xff003049)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Text(
                              'Tên',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Lalezar',
                              ),
                            ),
                          ),
                          Text(
                            'Chủ đề',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Lalezar',
                            ),
                          ),
                          Container(
                            child: Text(
                              'Điểm',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Lalezar',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Row(children: <Widget>[
                          Expanded(
                              child: Divider(
                            color: Colors.black,
                            thickness: 2,
                          ))
                        ])),
                    Container(
                      color: Colors.green,
                      width: size.width,
                      height: size.height * .65,
                      child: History.lsData == null ||
                              History.lsData.length <= 0
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemCount: History.lsData.length,
                              itemBuilder: ((context, index) {
                                var data = History.lsData;
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Container(
                                    width: size.width,
                                    height: size.height * .2,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 7, 106, 199),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        fit: StackFit.loose,
                                        children: <Widget>[
                                          //Name
                                          Positioned(
                                              left: 20,
                                              child: Container(
                                                  width: size.width,
                                                  height: 24,
                                                  child: Text(
                                                    data[index].name,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      fontFamily: 'Lalezar',
                                                    ),
                                                  ))),
                                          //Title
                                          Positioned(
                                              top: 20,
                                              child: Container(
                                                  width: size.width,
                                                  height: 24,
                                                  child: Center(
                                                    child: Text(
                                                      data[index].Topic,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        fontFamily: 'Lalezar',
                                                      ),
                                                    ),
                                                  ))),
                                          //Point
                                          Positioned(
                                              right: 20,
                                              child: Container(
                                                  height: 24,
                                                  child: Text(
                                                    data[index]
                                                        .point
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      fontFamily: 'Lalezar',
                                                    ),
                                                  ))),
                                        ]),
                                  ),
                                );
                              })),
                    ),
                  ],
                )),
            //Kết thúc phần giao diện lich su

            //Chức Năng nạp Credit
            Visibility(
              visible: credit,
              child: Column(
                children: [
                  Container(
                    height: 85,
                    padding: const EdgeInsets.only(left: 55, right: 55),
                    decoration: BoxDecoration(
                        color: const Color(0xfffee0a4),
                        borderRadius: BorderRadius.circular(15)),
                    margin: const EdgeInsets.only(top: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          'NẠP CREDIT',
                          style: TextStyle(
                            fontSize: 45,
                            fontFamily: 'Lalezar',
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 10
                              ..color = const Color(0xffffb155),
                          ),
                        ),
                        const Text(
                          'NẠP CREDIT',
                          style: TextStyle(
                              fontFamily: 'Lalezar',
                              fontSize: 45,
                              color: Color(0xffdf2322)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 15),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Chọn mức giá',
                        style: TextStyle(
                          fontSize: 23,
                          fontFamily: 'Lalezar',
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 15, right: 100),
                      child: Row(children: const <Widget>[
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                          thickness: 2,
                        ))
                      ])),
                  GestureDetector(
                    child: InkWell(
                      onTap: () {
                        NapThe().Nap(100, context);
                        setState(() {});
                      },
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: const Color(0xfffce444).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15)),
                          margin: const EdgeInsets.only(
                              top: 10, left: 15, right: 15),
                          child: Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/dollar.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ],
                                  )),
                              Container(
                                margin: const EdgeInsets.only(top: 5, left: 15),
                                child: const Text(
                                  '100 = 50.000 VNĐ',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'Lalezar',
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  GestureDetector(
                    child: InkWell(
                      onTap: () {
                        NapThe().Nap(250, context);
                        setState(() {});
                      },
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: const Color(0xfffce444).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15)),
                          margin: const EdgeInsets.only(
                              top: 10, left: 15, right: 15),
                          child: Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/dollar.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ],
                                  )),
                              Container(
                                margin: const EdgeInsets.only(top: 5, left: 15),
                                child: const Text(
                                  '250 = 125.000 VNĐ',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'Lalezar',
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  GestureDetector(
                    child: InkWell(
                      onTap: () {
                        NapThe().Nap(500, context);
                        setState(() {});
                      },
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: const Color(0xfffce444).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15)),
                          margin: const EdgeInsets.only(
                              top: 10, left: 15, right: 15),
                          child: Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/dollar.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ],
                                  )),
                              Container(
                                margin: const EdgeInsets.only(top: 5, left: 15),
                                child: const Text(
                                  '500 = 200.000 VNĐ',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'Lalezar',
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  GestureDetector(
                    child: InkWell(
                      onTap: () {
                        NapThe().Nap(1000, context);
                        setState(() {});
                      },
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: const Color(0xfffce444).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15)),
                          margin: const EdgeInsets.only(
                              top: 10, left: 15, right: 15),
                          child: Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/dollar.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ],
                                  )),
                              Container(
                                margin: const EdgeInsets.only(top: 5, left: 15),
                                child: const Text(
                                  '1000 = 400.000 VNĐ',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'Lalezar',
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  GestureDetector(
                    child: InkWell(
                      onTap: () {
                        NapThe().Nap(2000, context);
                        setState(() {});
                      },
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: const Color(0xfffce444).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15)),
                          margin: const EdgeInsets.only(
                              top: 10, left: 15, right: 15),
                          child: Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/dollar.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ],
                                  )),
                              Container(
                                margin: const EdgeInsets.only(top: 5, left: 15),
                                child: const Text(
                                  '2000 = 900.000 VNĐ',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'Lalezar',
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  GestureDetector(
                    child: InkWell(
                      onTap: () {
                        NapThe().Nap(5000, context);
                        setState(() {});
                      },
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: const Color(0xfffce444).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15)),
                          margin: const EdgeInsets.only(
                              top: 10, left: 15, right: 15),
                          child: Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/dollar.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ],
                                  )),
                              Container(
                                margin: const EdgeInsets.only(top: 5, left: 15),
                                child: const Text(
                                  '5000 = 2.000.000 VNĐ',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'Lalezar',
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),

            Visibility(
              visible: status,
              child: Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            height: 80,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color(0xfff3d07f),
                                borderRadius: BorderRadius.circular(25)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: colorRanking,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: IconButton(
                                    icon: Image.asset('images/ranking.png'),
                                    iconSize: 50,
                                    onPressed: () {
                                      setState(() {
                                        rankings = true;
                                        topics = false;
                                        settings = false;
                                        username = false;
                                        divider = false;
                                        history = false;
                                        credit = false;
                                        colorRanking = Color(0xfff1a649);
                                        colorPlaying = Colors.transparent;
                                        colorSetting = Colors.transparent;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: colorPlaying,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: IconButton(
                                    icon: Image.asset(
                                        'images/game_controller.png'),
                                    iconSize: 50,
                                    onPressed: () {
                                      setState(() {
                                        topics = true;
                                        settings = false;
                                        rankings = false;
                                        username = true;
                                        divider = true;
                                        history = false;
                                        credit = false;
                                        colorRanking = Colors.transparent;
                                        colorPlaying = Color(0xfff1a649);
                                        colorSetting = Colors.transparent;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: colorSetting,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: IconButton(
                                    icon: Image.asset('images/setting.png'),
                                    iconSize: 50,
                                    onPressed: () {
                                      setState(() {
                                        topics = false;
                                        settings = true;
                                        rankings = false;
                                        username = true;
                                        divider = true;
                                        history = false;
                                        credit = false;
                                        colorRanking = Colors.transparent;
                                        colorPlaying = Colors.transparent;
                                        colorSetting = Color(0xfff1a649);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
