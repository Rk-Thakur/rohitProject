import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rohit_projectt/provider/crud_model.dart';
import 'package:rohit_projectt/provider/crud_provider.dart';
import 'package:rohit_projectt/screen/passport_entry.dart';

import '../Widget/category.dart';
import '../model/passport_model.dart';

class PassportFormPage extends ConsumerStatefulWidget {
  const PassportFormPage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<PassportFormPage> {
  TextEditingController name = TextEditingController();
  TextEditingController family_name = TextEditingController();
  TextEditingController permanent_address = TextEditingController();
  TextEditingController residential_address = TextEditingController();
  TextEditingController personal_number = TextEditingController();
  TextEditingController office_number = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController father_name = TextEditingController();
  TextEditingController mother_name = TextEditingController();
  TextEditingController religion = TextEditingController();
  TextEditingController blood_group = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController marital_status = TextEditingController();
  TextEditingController passport_number = TextEditingController();
  TextEditingController validityofvisa = TextEditingController();
  TextEditingController currentvisatype = TextEditingController();
  TextEditingController dateofissues = TextEditingController();
  TextEditingController dateofexpiry = TextEditingController();
  TextEditingController visatype = TextEditingController();
  TextEditingController working_organization = TextEditingController();
  TextEditingController remarks = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController to = TextEditingController();

  //Education Qualification
  TextEditingController degree = TextEditingController();
  TextEditingController university = TextEditingController();
  TextEditingController division = TextEditingController();
  TextEditingController passedyear = TextEditingController();

  //professional Description
  TextEditingController nameOfOrganization = TextEditingController();
  TextEditingController addressOfOrganization = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController contactNumberofOrganization = TextEditingController();
  TextEditingController contactEmailOfOrganization = TextEditingController();
  TextEditingController focalPersonOfOrganization = TextEditingController();
  TextEditingController telephone = TextEditingController();

  //reference
  TextEditingController referenceName = TextEditingController();
  TextEditingController referenceNumber = TextEditingController();

  //checkout details
  TextEditingController passportreceived = TextEditingController();
  TextEditingController passportcheckout = TextEditingController();

  GlobalKey<FormState> personalform = GlobalKey<FormState>();
  XFile? image;
  Future<void> getImage() async {
    final ImagePicker _picker = ImagePicker();

    await _picker
        .pickImage(source: ImageSource.gallery)
        .then((value) => value != null
            ? setState(() {
                image = value;
              })
            : null);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<PassState>(crudProvider, (previous, next) {
      if (next.passstate == PassportState.added) {
        Get.to(() => const PassportPage());
      }
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Passport Details"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                title: Text('Home'),
                leading: const Icon(Icons.home),
                onTap: () {
                  Get.to(() => const PassportPage());
                },
              ),
              ListTile(
                title: Text('Add Details'),
                leading: const Icon(Icons.add_moderator),
                onTap: () {
                  Get.to(() => const PassportFormPage());
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: personalform,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      getImage();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                        ),
                        height: 350,
                        width: double.infinity,
                        child: image == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Select Image',
                                      style: TextStyle(
                                        fontSize: 25,
                                      ),
                                    )
                                  ],
                                ))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Center(
                                  child: Image.file(
                                    File(image!.path),
                                    fit: BoxFit.fill,
                                    height: 350,
                                    width: double.infinity,
                                  ),
                                ),
                              )),
                  ),
                  SizedBox(
                    height: height,
                  ),
                  GFAccordion(
                    title: "Personal Information",
                    titleBorderRadius: BorderRadius.circular(10),
                    textStyle: TextStyle(
                      fontSize: h1,
                      fontWeight: f0,
                    ),
                    contentChild: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Name / ?????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: family_name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Family Name / ??????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: permanent_address,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Permanent Address / ??????????????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: residential_address,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Residental Address / ??????????????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: personal_number,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Personal Number / ???????????????????????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: office_number,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Office Number / ????????????????????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.datetime,
                              controller: dateofbirth,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Date of Birth / ???????????? ????????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: nationality,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Nationality / ?????????????????????????????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: father_name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Father Name / ?????????????????? ?????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: mother_name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Mother  Name / ??????????????? ?????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: religion,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Religion / ????????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: blood_group,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Blood Group / ???????????? ???????????? ',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Email Address / ????????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: marital_status,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Marital Status / ????????????????????? ??????????????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            Text('Previous Stay in Nepal / ????????????????????? ??????????????? ????????????'),
                            Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Card(
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              controller: visatype,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText:
                                                    'Visa Type / ???????????? ??????????????????',
                                                labelStyle: TextStyle(
                                                  fontSize: labelsize,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height,
                                            ),
                                            TextFormField(
                                              controller: duration,
                                              keyboardType:
                                                  TextInputType.datetime,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText:
                                                    'Duration:From / ????????????: ???????????? ',
                                                labelStyle: TextStyle(
                                                  fontSize: labelsize,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height,
                                            ),
                                            TextFormField(
                                              controller: to,
                                              keyboardType:
                                                  TextInputType.datetime,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'To / ????????????',
                                                labelStyle: TextStyle(
                                                  fontSize: labelsize,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height,
                                            ),
                                            TextFormField(
                                              controller: working_organization,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText:
                                                    'Organization,if working visa / ??????????????? ',
                                                labelStyle: TextStyle(
                                                  fontSize: labelsize,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height,
                                            ),
                                            TextFormField(
                                              controller: remarks,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: '??????????????????',
                                                labelStyle: TextStyle(
                                                  fontSize: labelsize,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GFAccordion(
                    title: "Passport Details",
                    titleBorderRadius: BorderRadius.circular(10),
                    textStyle: TextStyle(
                      fontSize: h1,
                      fontWeight: f0,
                    ),
                    contentChild: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Required / ??????????????????'
                                    : null;
                              },
                              controller: passport_number,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Passport No: / ????????????????????? ??????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Required / ??????????????????'
                                    : null;
                              },
                              controller: validityofvisa,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Validity of Visa / ?????????????????? ???????????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Required / ??????????????????'
                                    : null;
                              },
                              controller: currentvisatype,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Current Visa Type / ???????????? ??????????????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Required / ??????????????????'
                                    : null;
                              },
                              controller: dateofissues,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Date Of Issues / ???????????? ????????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Required / ??????????????????'
                                    : null;
                              },
                              controller: dateofexpiry,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Date Of Expiry / ??????????????? ??????????????? ?????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GFAccordion(
                    title: 'Education Qualification',
                    titleBorderRadius: BorderRadius.circular(10),
                    textStyle: TextStyle(
                      fontSize: h1,
                      fontWeight: f0,
                    ),
                    contentChild: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: degree,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Degree / ??????????????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: university,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'University/College (??????????????????????????????????????? / ????????????)',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: division,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Division/Rank (??????????????????)',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: passedyear,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Passed Year / ???????????????????????? ????????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GFAccordion(
                    title: 'Professional Description',
                    titleBorderRadius: BorderRadius.circular(10),
                    textStyle: TextStyle(
                      fontSize: h1,
                      fontWeight: f0,
                    ),
                    contentChild: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nameOfOrganization,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'Name of Organization /  ?????????????????????????????? ????????? ',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: addressOfOrganization,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'Address of Organization / ?????????????????????????????? ??????????????????  ',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: designation,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Designation / ??????????????? ',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: contactNumberofOrganization,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'Contact Number of Organization / ?????????????????????????????? ????????????????????? ??????. ',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: contactEmailOfOrganization,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'Contact Email of Organization / ?????????????????????????????? ????????????????????? ???????????? ',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: focalPersonOfOrganization,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'Focal Person of Organization  / ?????????????????????????????? ????????????????????? ????????????????????? ',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: telephone,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'Telephone No. Contact Person / ????????????????????? ??????????????????????????? ????????????????????? ??????.',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GFAccordion(
                    title: 'Reference Details',
                    titleBorderRadius: BorderRadius.circular(10),
                    textStyle: TextStyle(
                      fontSize: h1,
                      fontWeight: f0,
                    ),
                    contentChild: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: referenceName,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Reference Name / ????????????????????? ?????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: referenceNumber,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Reference Number / ????????????????????? ??????????????? ',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GFAccordion(
                    title: 'Checkout Details',
                    titleBorderRadius: BorderRadius.circular(10),
                    textStyle: TextStyle(
                      fontSize: h1,
                      fontWeight: f0,
                    ),
                    contentChild: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: passportreceived,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'Passport Received  / ????????????????????? ????????????????????? ????????????',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              controller: passportcheckout,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'Passport Checkout Date  / ????????????????????? ?????????????????? ???????????? ',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Random random = Random();
                      if (personalform.currentState!.validate()) {
                        if (image == null) {
                          AlertDialog(
                            title: const Text('Select Image'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("Okay"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        } else {
                          final passportDetails = PassportModel(
                              name: name.text,
                              family_name: family_name.text,
                              permanent_address: permanent_address.text,
                              residential_address: residential_address.text,
                              personal_number: personal_number.text,
                              office_number: office_number.text,
                              nationality: nationality.text,
                              father_name: father_name.text,
                              mother_name: mother_name.text,
                              religion: religion.text,
                              blood_group: blood_group.text,
                              email: email.text,
                              marital_status: marital_status.text,
                              passport_number: passport_number.text,
                              validityofvisa: validityofvisa.text,
                              currentvisatype: currentvisatype.text,
                              visatype: visatype.text,
                              working_organization: working_organization.text,
                              remarks: remarks.text,
                              degree: degree.text,
                              university: university.text,
                              division: division.text,
                              passedyear: passedyear.text,
                              nameOfOrganization: nameOfOrganization.text,
                              addressOfOrganization: addressOfOrganization.text,
                              designation: designation.text,
                              contactNumberOfOrganization:
                                  contactNumberofOrganization.text,
                              contactEmailOfOrganization:
                                  contactEmailOfOrganization.text,
                              focalPersonOfOrganization:
                                  focalPersonOfOrganization.text,
                              telephone: telephone.text,
                              referenceName: referenceName.text,
                              referenceNumber: referenceNumber.text,
                              dateOfBirth: dateofbirth.text,
                              passport_id: random.nextInt(2147483647),
                              visaduration: duration.text,
                              visato: duration.text,
                              image: image!.path,
                              dateofissues: dateofissues.text,
                              dateofexpiry: dateofexpiry.text,
                              passportcheckoutdate: passportcheckout.text,
                              passportreceiveddate: passportreceived.text);

                          ref
                              .read(crudProvider.notifier)
                              .setData(passportDetails);
                        }
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: h1,
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
      ),
    );
  }
}
