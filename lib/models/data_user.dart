
// ignore_for_file: prefer_final_fields, non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../prefer.dart';

class DataUser {

  static final fireStone = FirebaseFirestore.instance;
  static var _userTable = FirebaseFirestore.instance.collection("users");
  static String? mail, name, birth, phone, pic;
  static int? credit, highestPoint;

  static getAll(String email) async {
    _userTable.where('email', isEqualTo: email).get().then((value) {
      for (var a in value.docs) {
        mail = a.data()["email"];
        name = a.data()["name"];
        birth = a.data()["birthDate"];
        phone = a.data()["phone"];
        pic = a.data()["photoUrl"];
        credit = a.data()["credit"];
        highestPoint = a.data()["highestPoint"];

        Prefer.setBirthDate(birthdate: birth!);
        Prefer.setName(name: name!);
        Prefer.setPhone(phone: phone!);
        Prefer.setMail(mail: mail!);
        Prefer.setPicture(picture: pic!);
        Prefer.setCredit(credit: credit!.toString());
        Prefer.setScore(score: highestPoint!.toString());
        // print('-----------------------${Prefer.getScore()}');
      }
    });
  }

  static UploadPoint(int point) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: Prefer.getMail())
        .get();

    getAll(Prefer.getMail());

    if (int.parse(Prefer.getScore()) < point) {
      result.docs.forEach((doc) {
        doc.reference.update({'highestPoint': point});
      });
    }
  }

  static HistoryPlay(String topic, int point){
    fireStone.collection('history').add({
        'email': Prefer.getMail(),
        'name': Prefer.getName(),
        'Topic': topic,
        'point': point,
        'timeEnd': DateTime.now()
    });
  }
}
