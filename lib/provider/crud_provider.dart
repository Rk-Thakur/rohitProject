import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rohit_projectt/model/passport_model.dart';
import 'package:rohit_projectt/provider/crud_model.dart';
import 'package:rohit_projectt/services/db_services.dart';
import 'package:rohit_projectt/services/notification_services.dart';

final crudProvider =
    StateNotifierProvider<CrudProvider, PassState>((ref) => CrudProvider(ref));

class CrudProvider extends StateNotifier<PassState> {
  CrudProvider(this.ref)
      : super(PassState(
          passstate: PassportState.intial,
        ));
  final Ref ref;
  Future<void> setData(PassportModel passport) async {
    try {
      state = state.copyWith(passstate: PassportState.adding);
      await DBServices().setDetails(passport);
      NotificationServices()
          .Notify(name: passport.name, id: passport.created_date as int);
      state = state.copyWith(passstate: PassportState.added);
      print('added');
    } catch (e) {
      state = state.copyWith(
          passstate: PassportState.failure, errormessage: e.toString());
    }
  }

  Future<void> editingData(PassportModel passport, int index) async {
    try {
      state = state.copyWith(passstate: PassportState.editing);
      await DBServices().editDetails(index, passport);

      state = state.copyWith(passstate: PassportState.edited);
    } catch (e) {
      state = state.copyWith(
          passstate: PassportState.failure, errormessage: e.toString());
    }
  }
}
