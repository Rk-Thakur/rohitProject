import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rohit_projectt/model/passport_model.dart';
import 'package:rohit_projectt/provider/crud_model.dart';
import 'package:rohit_projectt/services/db_services.dart';

final crudProvider =
    StateNotifierProvider<CrudProvider, PassState>((ref) => CrudProvider(ref));

class CrudProvider extends StateNotifier<PassState> {
  CrudProvider(this.ref)
      : super(PassState(
          passstate: PassportState.intial,
        ));
  final Ref ref;
  Future<bool> setData(PassportModel passport) async {
    try {
      state = state.copyWith(passstate: PassportState.adding);
      await DBServices().setDetails(passport);
      state = state.copyWith(passstate: PassportState.added);
      return true;
    } catch (e) {
      state = state.copyWith(
          passstate: PassportState.failure, errormessage: e.toString());
      return false;
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

  Future<void> deleteData(int index) async {
    try {
      await DBServices().deleteDetails(index);
      state = state.copyWith(passstate: PassportState.deleted);
    } catch (e) {
      state = state.copyWith(
          passstate: PassportState.failure, errormessage: e.toString());
    }
  }
}
