import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:rohit_projectt/provider/crud_model.dart';
import 'package:rohit_projectt/provider/crud_provider.dart';

import '../common/k_text_form.dart';
import '../model/passport_model.dart';
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
                              if (formKey.currentState!.validate()) {
                                final newPassportDetails = PassportModel(
                                    passportNumber: passportNumber.text.trim(),
                                    name: name.text.trim(),
                                    address: address.text.trim(),
                                    visaNumber: visaNumber.text.trim(),
                                    visaExpiry: visaExpiry.text.trim(),
                                    created_date: DateTime.now());
                                ref
                                    .read(crudProvider.notifier)
                                    .setData(newPassportDetails);
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
