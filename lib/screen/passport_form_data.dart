import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rohit_projectt/Widget/textformfield.dart';
import 'package:rohit_projectt/provider/crud_model.dart';
import 'package:rohit_projectt/provider/crud_provider.dart';
import 'package:rohit_projectt/screen/passport_entry.dart';

import '../Widget/category.dart';
import '../model/passport_model.dart';
import '../provider/image_provider.dart';

class PassportFormPage extends ConsumerStatefulWidget {
  const PassportFormPage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<PassportFormPage> {
  int _activeCurrentStep = 0;
  var stay_previous = ['Yes', 'No'];

  String? previous;
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
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: personalform,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        getImage();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                          ),
                          height: 150,
                          width: 150,
                          child: image == null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: const Center(
                                    child: Text("Image"),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Center(
                                    child: Image.file(
                                      File(image!.path),
                                      fit: BoxFit.fill,
                                      height: 150,
                                      width: double.infinity,
                                    ),
                                  ),
                                )),
                    ),
                    SizedBox(
                      height: height,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Personal Information',
                          style: TextStyle(
                            fontSize: h1,
                            fontWeight: f0,
                          ),
                        )),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Name / नाम',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: family_name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Family Name / थर',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: permanent_address,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Permanent Address / स्थायी',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: residential_address,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Residental Address / आवासीय',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: personal_number,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Personal Number / व्यक्तिगत',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: office_number,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Office Number / कार्यालय',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              keyboardType: TextInputType.datetime,
                              controller: dateofbirth,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Date of Birth / जन्म मिति',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: nationality,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Nationality / राष्ट्रियता',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: father_name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Father Name / बुबाको नाम',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: mother_name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Mother  Name / आमाको नाम',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: religion,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Religion / धर्म',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: blood_group,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Blood Group / रक्त समूह ',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: email,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Email Address / इमेल',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: marital_status,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Marital Status / वैवाहिक स्थिति',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: passport_number,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Passport No: / राहदानी नं',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: validityofvisa,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Validity of Visa / भिसाको म्याद',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: currentvisatype,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Current Visa Type / भिसा प्रकार',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height,
                            ),
                            Text('Previous Stay in Nepal / अघिल्लो नेपाल बसाइ'),
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
                                              // validator: (value) {
                                              //   return value!.isEmpty
                                              //       ? 'Required / आवश्यक'
                                              //       : null;
                                              // },
                                              controller: visatype,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText:
                                                    'Visa Type / भिसा प्रकार',
                                                labelStyle: TextStyle(
                                                  fontSize: labelsize,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height,
                                            ),
                                            TextFormField(
                                              // validator: (value) {
                                              //   return value!.isEmpty
                                              //       ? 'Required / आवश्यक'
                                              //       : null;
                                              // },
                                              controller: duration,
                                              keyboardType:
                                                  TextInputType.datetime,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText:
                                                    'Duration:From / अवधि: देखि ',
                                                labelStyle: TextStyle(
                                                  fontSize: labelsize,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height,
                                            ),
                                            TextFormField(
                                              // validator: (value) {
                                              //   return value!.isEmpty
                                              //       ? 'Required / आवश्यक'
                                              //       : null;
                                              // },
                                              controller: to,
                                              keyboardType:
                                                  TextInputType.datetime,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'To / सम्म',
                                                labelStyle: TextStyle(
                                                  fontSize: labelsize,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height,
                                            ),
                                            TextFormField(
                                              // validator: (value) {
                                              //   return value!.isEmpty
                                              //       ? 'Required / आवश्यक'
                                              //       : null;
                                              // },
                                              controller: working_organization,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText:
                                                    'Organization,if working visa / संगठन ',
                                                labelStyle: TextStyle(
                                                  fontSize: labelsize,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height,
                                            ),
                                            TextFormField(
                                              // validator: (value) {
                                              //   return value!.isEmpty
                                              //       ? 'Required / आवश्यक'
                                              //       : null;
                                              // },
                                              controller: remarks,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'कैफियत',
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
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Education Qualification',
                          style: TextStyle(
                            fontSize: h1,
                            fontWeight: f0,
                          ),
                        )),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height,
                            ),
                            TextFormField(
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: degree,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Degree / डिग्री',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: university,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'University/College (विश्वविद्यालय / कलेज)',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: division,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Division/Rank (श्रेणी)',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: passedyear,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Passed Year / उत्तीर्ण वर्ष',
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
                    SizedBox(
                      height: height,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Professional Description ',
                          style: TextStyle(
                            fontSize: h1,
                            fontWeight: f0,
                          ),
                        )),
                    SizedBox(
                      height: height,
                    ),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: nameOfOrganization,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'Name of Organization /  कार्यालयको नाम ',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: addressOfOrganization,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'Address of Organization / कार्यालयको ठेगाना  ',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: designation,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Designation / दर्जा ',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: contactNumberofOrganization,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'Contact Number of Organization / कार्यालयको सम्पर्क नं. ',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: contactEmailOfOrganization,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'Contact Email of Organization / कार्यालयको सम्पर्क ईमेल ',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: focalPersonOfOrganization,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'Focal Person of Organization  / कार्यालयको सम्पर्क व्यक्ति ',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: telephone,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'Telephone No. Contact Person / सम्पर्क व्यक्तिको टेलिफोन नं.',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Reference Details ',
                          style: TextStyle(
                            fontSize: h1,
                            fontWeight: f0,
                          ),
                        )),
                    SizedBox(
                      height: height,
                    ),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: referenceName,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Reference Name / सन्दर्भ नाम',
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
                                    ? 'Required / आवश्यक'
                                    : null;
                              },
                              controller: referenceNumber,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Reference Number / सन्दर्भ नम्बर ',
                                labelStyle: TextStyle(
                                  fontSize: labelsize,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height,
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
                                addressOfOrganization:
                                    addressOfOrganization.text,
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
                                image: image!.path);

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
                            "Send",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: h1,
                            ),
                          ),
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
        ),
      ),
    );
  }
}
