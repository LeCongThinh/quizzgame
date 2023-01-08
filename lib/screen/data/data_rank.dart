import 'package:cloud_firestore/cloud_firestore.dart';



class UserModel {
  String name, img, mail;
  int score;
  UserModel(
      {required this.name,
      required this.mail,
      required this.img,
      required this.score});
}

class UserData {
  static List<UserModel> lsData = [];
  static getDataUser() async {
    await FirebaseFirestore.instance
        .collection("users")
        .orderBy("highestPoint", descending: true)
        .get()
        .then((value) {
      for (var a in value.docs) {
        lsData.add(UserModel(
            name: a.data()['name'],
            img: a.data()['photoUrl'],
            mail: a.data()['email'],
            score: a.data()['highestPoint']));
      }
    });
  }
}
