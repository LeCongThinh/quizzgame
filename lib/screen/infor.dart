// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, avoid_print, prefer_const_constructors_in_immutables, depend_on_referenced_packages, sort_child_properties_last

import 'package:do_an/screen/google_login.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../prefer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountInformation extends StatefulWidget {
  AccountInformation({Key? key}) : super(key: key);

  @override
  State<AccountInformation> createState() => AccountInformationState();
}

class AccountInformationState extends State<AccountInformation> {
  final txtName = TextEditingController();
  final txtBirthDate = TextEditingController();
  final txtPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcbf49),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xfff9ecc2),
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
          onTap: (() {
            Navigator.pop(context);
          }),
        ),
        title: Text(
          'Thông tin tài khoản',
          style: TextStyle(
              color: Colors.black, fontFamily: 'Lalezar', fontSize: 27),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('${Prefer.getPicture()}'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                '${Prefer.getMail()}',
                style: TextStyle(fontFamily: 'Lalezar', fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                child: SizedBox(
                  height: 50,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xfff9ecc2),
                        hintText: '${Prefer.getName()}',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xff003049),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Lalezar',
                      ),
                      controller: txtName,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                child: SizedBox(
                  height: 50,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    child: TextField(
                      readOnly: true,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xfff9ecc2),
                        hintText: '${Prefer.getBirthDate()}',
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: Color(0xff003049),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Lalezar',
                      ),
                      controller: txtBirthDate,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now());

                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                          print(formattedDate);
                          setState(() {
                            txtBirthDate.text = formattedDate;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                child: SizedBox(
                  height: 50,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xfff9ecc2),
                        hintText: '${Prefer.getPhone()}',
                        prefixIcon: Icon(
                          Icons.phone_android,
                          color: Color(0xff003049),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Lalezar',
                      ),
                      controller: txtPhone,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        if (txtName.text.isEmpty &&
                            txtBirthDate.text.isEmpty &&
                            txtPhone.text.isEmpty) {
                          final snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              message: 'Thông tin cập nhật tài khoản trống',
                              title: 'Thông báo !!!',
                              contentType: ContentType.failure,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        } else {
                          GoogleLogin().UpdateInfor(context, txtName.text,
                              txtBirthDate.text, txtPhone.text);
                          setState(() {
                            txtName.clear();
                            txtBirthDate.clear();
                            txtPhone.clear();
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        // ignore: prefer_const_constructors
                        child: Text(
                          'Cập nhật thông tin',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'Lalezar',
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
