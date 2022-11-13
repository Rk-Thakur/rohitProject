import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:rohit_projectt/common/k_text_form.dart';
import 'package:rohit_projectt/provider/crud_provider.dart';

import '../model/passport_model.dart';
import '../provider/crud_model.dart';

// ignore: must_be_immutable
class EditPassportDetails extends ConsumerStatefulWidget {
  EditPassportDetails({Key? key, required this.passport, required this.index})
      : super(key: key);
  PassportModel passport;
  int index;

  @override
  ConsumerState<EditPassportDetails> createState() =>
      _EditPassportDetailsState();
}

class _EditPassportDetailsState extends ConsumerState<EditPassportDetails> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final ControllePassportNumber = TextEditingController();
    final ControllerName = TextEditingController();
    final ControllerAddress = TextEditingController();
    final ControllerVisaNumber = TextEditingController();
    final ControllerVisaExpiry = TextEditingController();
    final DateTime? createdDate;

    ref.listen<PassState>(crudProvider, (previous, next) {
      if (next.passstate == PassportState.edited) {
        Get.back();
      }
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        KTextFormField(
                          label: "",
                          hint: "Passport Number",
                          keyboardType: TextInputType.text,
                          controller: ControllePassportNumber
                            ..text = widget.passport.passportNumber.toString(),
                          validator: (value) {
                            return value!.isEmpty ? 'Required' : null;
                          },
                        ),
                        KTextFormField(
                          label: "",
                          hint: "Name",
                          keyboardType: TextInputType.text,
                          controller: ControllerName
                            ..text = widget.passport.name.toString(),
                          validator: (value) {
                            return value!.isEmpty ? 'Required' : null;
                          },
                        ),
                        KTextFormField(
                          label: "",
                          hint: "Address",
                          keyboardType: TextInputType.text,
                          controller: ControllerAddress
                            ..text = widget.passport.address.toString(),
                          validator: (value) {
                            return value!.isEmpty ? 'Required' : null;
                          },
                        ),
                        KTextFormField(
                          label: "",
                          hint: "Visa Number",
                          keyboardType: TextInputType.text,
                          controller: ControllerVisaNumber
                            ..text = widget.passport.visaNumber.toString(),
                          validator: (value) {
                            return value!.isEmpty ? 'Required' : null;
                          },
                        ),
                        KTextFormField(
                          label: "",
                          hint: "Visa Expiry",
                          keyboardType: TextInputType.text,
                          controller: ControllerVisaExpiry
                            ..text = widget.passport.visaExpiry.toString(),
                          validator: (value) {
                            return value!.isEmpty ? 'Required' : null;
                          },
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                final newPassportDetails = PassportModel(
                                    passportNumber:
                                        ControllePassportNumber.text.trim(),
                                    name: ControllerName.text.trim(),
                                    address: ControllerAddress.text.trim(),
                                    visaNumber:
                                        ControllerVisaNumber.text.trim(),
                                    visaExpiry:
                                        ControllerVisaExpiry.text.trim(),
                                    created_date: DateTime.now());
                                ref.read(crudProvider.notifier).editingData(
                                    newPassportDetails, widget.index);
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
