import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rohit_projectt/model/passport_model.dart';

import '../Widget/KText.dart';

// ignore: must_be_immutable
class PassportDetails extends ConsumerStatefulWidget {
  PassportDetails({Key? key, required this.passport}) : super(key: key);
  PassportModel passport;

  @override
  ConsumerState<PassportDetails> createState() => _PassportDetailsState();
}

class _PassportDetailsState extends ConsumerState<PassportDetails> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 10),
                  child: Center(
                    child: Card(
                      elevation: 3,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 10,
                          ),
                          child: Column(
                            children: [
                              KText(
                                align: Alignment.topLeft,
                                title: "Image",
                                fontSize: 15.00,
                              ),
                              Container(
                                width: 300,
                                height: 300,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Center(
                                        child: widget.passport.image != null
                                            ? Image.file(
                                                File(widget.passport.image!),
                                                fit: BoxFit.cover,
                                                width: 300,
                                                height: 300,
                                              )
                                            : Image.asset(
                                                "assets/formal.png"))),
                              ),
                              KText(
                                align: Alignment.topLeft,
                                title: "\nFullName",
                                fontSize: 15.00,
                              ),
                              KText(
                                align: Alignment.center,
                                title: widget.passport.name!,
                                fontSize: 20.00,
                              ),
                              KText(
                                align: Alignment.topLeft,
                                title: "Address",
                                fontSize: 15.00,
                              ),
                              KText(
                                align: Alignment.center,
                                title: widget.passport.address!,
                                fontSize: 20.00,
                              ),
                              KText(
                                align: Alignment.topLeft,
                                title: "Visa Expiry",
                                fontSize: 15.00,
                              ),
                              KText(
                                align: Alignment.center,
                                title: widget.passport.visaExpiry!,
                                fontSize: 20.00,
                              ),
                              KText(
                                align: Alignment.topLeft,
                                title: "Visa Number",
                                fontSize: 15.00,
                              ),
                              KText(
                                align: Alignment.center,
                                title: widget.passport.visaNumber!,
                                fontSize: 20.00,
                              ),
                              KText(
                                align: Alignment.topLeft,
                                title: "Passport Number:",
                                fontSize: 15.00,
                              ),
                              KText(
                                align: Alignment.center,
                                title: widget.passport.passportNumber!,
                                fontSize: 20.00,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
