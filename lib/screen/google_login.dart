// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, prefer_is_empty, non_constant_identifier_names, prefer_final_fields

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:do_an/models/data_user.dart';
import 'package:do_an/prefer.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'start.dart';

class GoogleLogin {
  static int credit = 1000, highestPoint = 0;
  static final fireStone = FirebaseFirestore.instance;

  static GoogleSignInAccount? userObj;
  static GoogleSignIn _googleSignIn = GoogleSignIn();

  void LogIn(context) async {
    _googleSignIn.signOut();
    userObj = await _googleSignIn.signIn();

    Prefer.setMail(mail: userObj!.email);
    Prefer.setPicture(picture: userObj!.photoUrl.toString());

    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: Prefer.getMail())
        .get();

    final List<DocumentSnapshot> documents = result.docs;

    if (documents.length > 0) {
      result.docs.forEach((doc) {
        doc.reference.update({'timeLogin': DateTime.now()});
      });

      DataUser.getAll(Prefer.getMail());
    } else {
      fireStone.collection('users').add({
        'email': userObj!.email,
        'name': userObj!.displayName,
        'photoUrl': userObj!.photoUrl,
        'timeLogin': DateTime.now(),
        'birthDate': 'Chưa có ngày sinh',
        'phone': 'Chưa có số điện thoại',
        'credit': credit,
        'highestPoint': highestPoint,
      });

      Prefer.setName(name: userObj!.displayName.toString());
      Prefer.setBirthDate(birthdate: 'Chưa có ngày sinh');
      Prefer.setPhone(phone: 'Chưa có số điện thoại');
      Prefer.setCredit(credit: credit.toString());
      Prefer.setScore(score: highestPoint.toString());
    }

    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Start(),
        ));
  }

  void UpdateInfor(
      context, String txtName, String txtBirthDate, String txtPhone) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: Prefer.getMail())
        .get();

    if (txtName != "") {
      result.docs.forEach((doc) {
        doc.reference.update({'name': txtName});
      });
      Prefer.setName(name: txtName);
    }

    if (txtBirthDate != "") {
      result.docs.forEach((doc) {
        doc.reference.update({'birthDate': txtBirthDate});
      });
      Prefer.setBirthDate(birthdate: txtBirthDate);
    }

    if (txtPhone != "") {
      result.docs.forEach((doc) {
        doc.reference.update({'phone': txtPhone});
      });
      Prefer.setPhone(phone: txtPhone);
    }

    // showDialog(
    //     context: context,
    //     builder: (ctx) {
    //       return AlertDialog(
    //         title: Text('Thông báo'),
    //         content: Text(
    //             'Cập nhật thành công! Vui lòng đăng nhập lại để hiện thông tin mới'),
    //         actions: [
    //           TextButton(onPressed: () => Navigator.pop(ctx), child: Text('OK'))
    //         ],
    //       );
    //     });

    final snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              message: 'Cập nhật thành công! Vui lòng đăng nhập lại để hiện thông tin mới',
                              title: 'Thông báo !!!',
                              contentType: ContentType.success,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
  }
}