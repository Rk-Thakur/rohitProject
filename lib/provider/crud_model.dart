// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

enum PassportState { intial, adding, added, editing, edited, delete, failure }

class PassState extends Equatable {
  final PassportState passstate;
  final String? errormessage;
  PassState({
    required this.passstate,
    this.errormessage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [passstate, errormessage];

  PassState copyWith({
    PassportState? passstate,
    String? errormessage,
  }) {
    return PassState(
      passstate: passstate ?? this.passstate,
      errormessage: errormessage ?? this.errormessage,
    );
  }
}
