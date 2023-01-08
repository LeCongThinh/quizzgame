// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class Prefer {
  static SharedPreferences? prefs;

  static const _keyMail = "_KeyMail";
  static const _keyName = "_KeyName";
  static const _keyPicture = "_KeyPicture";
  static const _keyBirthDate = "_keyBirth";
  static const _keyPhone = "_keyPhone";
  static const _keyCredit = "_keyCredit";
  static const _keyScore = "_keyScore";

  static Future InitPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  //Prefer Mail
  static Future setMail({required String mail}) async => await prefs!.setString(_keyMail, mail);

  static Future setName({required String name}) async => await prefs!.setString(_keyName, name);

  static Future setPicture({required String picture}) async => await prefs!.setString(_keyPicture, picture);

  static Future setBirthDate({required String birthdate}) async => await prefs!.setString(_keyBirthDate, birthdate);

  static Future setPhone({required String phone}) async => await prefs!.setString(_keyPhone, phone);

  static Future setCredit({required String credit}) async => await prefs!.setString(_keyCredit, credit);

  static Future setScore({required String score}) async => await prefs!.setString(_keyScore, score);

  static getMail() => prefs!.getString(_keyMail);

  static getName() => prefs!.getString(_keyName);

  static getPicture() => prefs!.getString(_keyPicture);

  static getBirthDate() => prefs!.getString(_keyBirthDate);

  static getPhone() => prefs!.getString(_keyPhone);

  static getCredit() => prefs!.getString(_keyCredit);

  static getScore() => prefs!.getString(_keyScore);

  static Future removeMail() async => prefs!.remove(_keyMail);
  static Future removeName() async => prefs!.remove(_keyName);
  static Future removePicture() async => prefs!.remove(_keyPicture);
  static Future removeBirthDate() async => prefs!.remove(_keyBirthDate);
  static Future removePhone() async => prefs!.remove(_keyPhone);
  static Future removeCredit() async => prefs!.remove(_keyCredit);
  static Future removeScore() async => prefs!.remove(_keyScore);

  static Future removeAll()async{
    await removeMail();
    await removeName();
    await removePicture();
    await removeBirthDate();
    await removePhone();
  }
}
