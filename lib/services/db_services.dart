import 'package:hive/hive.dart';

import '../model/passport_model.dart';

class DBServices {
  final passportBox = Hive.box('passport');

  Future<void> setDetails(PassportModel passport) async {
    try {
      await passportBox.add(passport);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> editDetails(int index, PassportModel passport) async {
    try {
      await passportBox.putAt(index, passport);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> deleteDetails(int index) async {
    try {
      await passportBox.deleteAt(index);
    } catch (e) {
      throw e.toString();
    }
  }

  close() {
    Hive.close();
  }
}
