import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:rohit_projectt/common/k_text_form.dart';
import 'package:rohit_projectt/provider/crud_provider.dart';

import '../model/passport_model.dart';
import '../provider/crud_model.dart';
import '../provider/image_provider.dart';

class EditPassportDetails extends StatelessWidget {
  final PassportModel passport;
  final int index;
  EditPassportDetails(this.passport, this.index);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final ControllePassportNumber = TextEditingController();
    final ControllerName = TextEditingController();
    final ControllerAddress = TextEditingController();
    final ControllerVisaNumber = TextEditingController();
    final ControllerVisaExpiry = TextEditingController();
    final DateTime? createdDate;

    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer(
          builder: (context, ref, child) {
            final editimage = ref.watch(imageProvider).image;
            ref.listen<PassState>(crudProvider, (previous, next) {
              if (next.passstate == PassportState.edited) {
                Get.back();
              }
            });
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                ),
                                height: 350,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                        child: editimage == null
                                            ? Container(
                                                height: 350,
                                                width: double.infinity,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Image.file(
                                                      File(passport.image!),
                                                      fit: BoxFit.cover,
                                                    )))
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Center(
                                                  child: Image.file(
                                                    File(editimage.path),
                                                    fit: BoxFit.fill,
                                                    height: 350,
                                                    width: double.infinity,
                                                  ),
                                                ),
                                              )),
                                    Positioned(
                                      right: 5,
                                      top: 5,
                                      child: GestureDetector(
                                        onTap: () async {
                                          ref.read(imageProvider).getImage();
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: const Color(0xff10A6D9),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.white)),
                                          child: const Icon(
                                            Icons.camera_alt_outlined,
                                            color: Color(0xffFCFCFC),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: ControllePassportNumber
                                ..text = passport.passportNumber.toString(),
                              validator: (value) {
                                return value!.isEmpty ? 'Required' : null;
                              },
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(0xff1C1B1F),
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: 'Passport Number',
                                  labelStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: ControllerName
                                ..text = passport.name.toString(),
                              validator: (value) {
                                return value!.isEmpty ? 'Required' : null;
                              },
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(0xff1C1B1F),
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: 'Full Name',
                                  labelStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: ControllerAddress
                                ..text = passport.address.toString(),
                              validator: (value) {
                                return value!.isEmpty ? 'Required' : null;
                              },
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(0xff1C1B1F),
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: 'Address',
                                  labelStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: ControllerVisaNumber
                                ..text = passport.visaNumber.toString(),
                              validator: (value) {
                                return value!.isEmpty ? 'Required' : null;
                              },
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(0xff1C1B1F),
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: 'Address',
                                  labelStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: ControllerVisaExpiry
                                ..text = passport.visaExpiry.toString(),
                              validator: (value) {
                                return value!.isEmpty ? 'Required' : null;
                              },
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(0xff1C1B1F),
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: 'Address',
                                  labelStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                  )),
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xff10A6D9)),
                                ),
                                onPressed: () async {
                                  formKey.currentState!.save();
                                  if (formKey.currentState!.validate()) {
                                    if (editimage == null) {
                                      final newPassportDetails = PassportModel(
                                        passportNumber:
                                            ControllePassportNumber.text.trim(),
                                        name: ControllerName.text.trim(),
                                        address: ControllerAddress.text.trim(),
                                        visaNumber:
                                            ControllerVisaNumber.text.trim(),
                                        visaExpiry:
                                            ControllerVisaExpiry.text.trim(),
                                        created_date: DateTime.now(),
                                        image: passport.image,
                                        passport_id: passport.passport_id,
                                      );
                                      ref
                                          .read(crudProvider.notifier)
                                          .editingData(
                                              newPassportDetails, index);
                                    } else {
                                      final newPassportDetails = PassportModel(
                                        passportNumber:
                                            ControllePassportNumber.text.trim(),
                                        name: ControllerName.text.trim(),
                                        address: ControllerAddress.text.trim(),
                                        visaNumber:
                                            ControllerVisaNumber.text.trim(),
                                        visaExpiry:
                                            ControllerVisaExpiry.text.trim(),
                                        created_date: DateTime.now(),
                                        passport_id: passport.passport_id,
                                        image: editimage.path,
                                      );
                                      ref
                                          .read(crudProvider.notifier)
                                          .editingData(
                                              newPassportDetails, index);
                                    }
                                  }
                                },
                                child: const Icon(Icons.add))
                          ],
                        )),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
