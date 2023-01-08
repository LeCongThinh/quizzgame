// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'package:do_an/prefer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/data_user.dart';

class NapThe {
  void Nap(int sonap ,context) async {
    final QuerySnapshot result = await FirebaseFirestore.instance.collection('users')
    .where('email', isEqualTo: Prefer.getMail()).get();

    final List <DocumentSnapshot> documents = result.docs;

    if (documents.isNotEmpty) {

      result.docs.forEach((doc) {
        doc.reference.update({'credit' : int.parse(Prefer.getCredit()) + sonap});
      });

      DataUser.getAll(Prefer.getMail());
showDialog(
      context: context,
      builder: (ctx){
        return AlertDialog(
          title: const Text('Thông báo'),
          content: const Text('Nạp thành công !'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx),
              child: const Text('OK')
            )
          ],
        );
      }
    );
    }
  }
}
