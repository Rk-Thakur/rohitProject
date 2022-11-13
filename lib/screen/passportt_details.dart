import 'package:flutter/material.dart';
import 'package:rohit_projectt/model/passport_model.dart';

// ignore: must_be_immutable
class PassportDetails extends StatefulWidget {
  PassportDetails({Key? key, required this.passport}) : super(key: key);
  PassportModel passport;

  @override
  State<PassportDetails> createState() => _PassportDetailsState();
}

class _PassportDetailsState extends State<PassportDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.passport.name!),
            Text(widget.passport.address!),
            Text(widget.passport.visaExpiry!),
            Text(widget.passport.visaNumber!),
            Text(widget.passport.created_date.toString()),
            Text(widget.passport.passportNumber!),
          ],
        ),
      ),
    );
  }
}
