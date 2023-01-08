import 'package:cloud_firestore/cloud_firestore.dart';

import '../../prefer.dart';

class History {
  static List<HistoryModel> lsData = [];
  static getAllData() async {
    await FirebaseFirestore.instance.collection("history").where('email', isEqualTo: Prefer.getMail()).get().then((value) {
      for (var a in value.docs) {
        lsData.add(
          HistoryModel(
            Topic: a.data()['Topic'],
            name: a.data()['name'],
            point: a.data()['point'],
            timeEnd: a.data()['timeEnd'],
          ),
        );
      }
    });
  }
}

class HistoryModel {
  // ignore: non_constant_identifier_names
  String Topic, name;
  Timestamp timeEnd;
  String? timer;
  int point;
  HistoryModel(
      // ignore: non_constant_identifier_names
      {required this.Topic,
      required this.name,
      this.timer,
      required this.point,
      required this.timeEnd});
}
