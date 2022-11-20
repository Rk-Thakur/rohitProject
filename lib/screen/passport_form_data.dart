import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:rohit_projectt/provider/crud_model.dart';
import 'package:rohit_projectt/provider/crud_provider.dart';

import '../common/k_text_form.dart';
import '../model/passport_model.dart';
import '../provider/image_provider.dart';
import 'passport_entry.dart';

class PassportFormPage extends ConsumerStatefulWidget {
  const PassportFormPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PassportFormPage> createState() => _PassportFormPageState();
}

class _PassportFormPageState extends ConsumerState<PassportFormPage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final passportNumber = TextEditingController();
    final name = TextEditingController();
    final address = TextEditingController();
    final visaNumber = TextEditingController();
    final visaExpiry = TextEditingController();
    final DateTime? createdDate;

    ref.listen<PassState>(crudProvider, (previous, next) {
      if (next.passstate == PassportState.added) {
        // Get.back();
        Get.to(() => const PassportPage());
      }
    });
    final image = ref.watch(imageProvider).image;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
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
                                    child: image == null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: const Center(
                                              child: Text("Image"),
                                            ),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Center(
                                              child: Image.file(
                                                File(image.path),
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
                                              width: 2, color: Colors.white)),
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

                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 20, vertical: 10),
                        //   child: InkWell(
                        //     onTap: () {
                        //       ref.read(imageProvider).getImage();
                        //     },
                        //     child: Container(
                        //         height: 350,
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(20),
                        //             border: Border.all(color: Colors.black)),
                        //         child: image == null
                        //             ? Center(child: Text('Select an image'))
                        //             : ClipRRect(
                        //                 borderRadius: BorderRadius.circular(20),
                        //                 child: Image.file(
                        //                   File(image.path),
                        //                   fit: BoxFit.cover,
                        //                 ),
                        //               )),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        KTextFormField(
                          label: "",
                          hint: "Passport Number",
                          keyboardType: TextInputType.text,
                          controller: passportNumber,
                          validator: (value) {
                            return value!.isEmpty ? 'Required' : null;
                          },
                        ),
                        KTextFormField(
                          label: "",
                          hint: "Name",
                          keyboardType: TextInputType.text,
                          controller: name,
                          validator: (value) {
                            return value!.isEmpty ? 'Required' : null;
                          },
                        ),
                        KTextFormField(
                          label: "",
                          hint: "Address",
                          keyboardType: TextInputType.text,
                          controller: address,
                          validator: (value) {
                            return value!.isEmpty ? 'Required' : null;
                          },
                        ),
                        KTextFormField(
                          label: "",
                          hint: "Visa Number",
                          keyboardType: TextInputType.text,
                          controller: visaNumber,
                          validator: (value) {
                            return value!.isEmpty ? 'Required' : null;
                          },
                        ),
                        KTextFormField(
                          label: "",
                          hint: "Visa Expiry",
                          keyboardType: TextInputType.text,
                          controller: visaExpiry,
                          validator: (value) {
                            return value!.isEmpty ? 'Required' : null;
                          },
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              Random random = Random();
                              formKey.currentState!.save();
                              if (formKey.currentState!.validate()) {
                                if (image == null) {
                                  Get.dialog(AlertDialog(
                                    title: const Text('Pleas select an image'),
                                    actions: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        icon: const Icon(Icons.close),
                                      )
                                    ],
                                  ));
                                } else {
                                  final newPassportDetails = PassportModel(
                                    passportNumber: passportNumber.text.trim(),
                                    name: name.text.trim(),
                                    address: address.text.trim(),
                                    visaNumber: visaNumber.text.trim(),
                                    visaExpiry: visaExpiry.text.trim(),
                                    created_date: DateTime.now(),
                                    passport_id: random.nextInt(2147483647),
                                    image: image.path,
                                  );
                                  final response =
                                      ref.read(crudProvider.notifier).setData(
                                            newPassportDetails,
                                          );
                                }
                              }
                            },
                            child: const Icon(Icons.add))
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
