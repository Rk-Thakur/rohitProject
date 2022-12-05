import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rohit_projectt/provider/crud_model.dart';
import 'package:rohit_projectt/screen/passport_entry.dart';

import '../Widget/category.dart';
import '../model/passport_model.dart';
import '../provider/crud_provider.dart';

class EditPassportDetails extends ConsumerStatefulWidget {
  final PassportModel passport;
  final int index;
  EditPassportDetails(this.passport, this.index);

  @override
  ConsumerState<EditPassportDetails> createState() =>
      _EditPassportDetailsState();
}

class _EditPassportDetailsState extends ConsumerState<EditPassportDetails> {
  TextEditingController name = TextEditingController();
  TextEditingController family_name = TextEditingController();
  TextEditingController permanent_address = TextEditingController();
  TextEditingController residential_address = TextEditingController();
  TextEditingController personal_number = TextEditingController();
  TextEditingController office_number = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController father_name = TextEditingController();
  TextEditingController mother_name = TextEditingController();
  TextEditingController dateofissues = TextEditingController();
  TextEditingController dateofexpiry = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();
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
      if (next.passstate == PassportState.edited) {
        Get.back();
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
                          height: 350,
                          width: double.infinity,
                          child: image == null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Center(
                                    child: Image.file(
                                      File(widget.passport.image.toString()),
                                      fit: BoxFit.fill,
                                      height: 400,
                                      width: double.infinity,
                                    ),
                                  ),
                                )
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
                                controller: name
                                  ..text = widget.passport.name.toString(),
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
                                controller: family_name
                                  ..text =
                                      widget.passport.family_name.toString(),
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
                                controller: permanent_address
                                  ..text = widget.passport.permanent_address
                                      .toString(),
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
                                controller: residential_address
                                  ..text = widget.passport.residential_address
                                      .toString(),
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
                                controller: personal_number
                                  ..text = widget.passport.personal_number
                                      .toString(),
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
                                controller: office_number
                                  ..text =
                                      widget.passport.office_number.toString(),
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
                                keyboardType: TextInputType.datetime,
                                controller: dateofbirth
                                  ..text =
                                      widget.passport.dateOfBirth.toString(),
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
                                controller: nationality
                                  ..text =
                                      widget.passport.nationality.toString(),
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
                                controller: father_name
                                  ..text =
                                      widget.passport.father_name.toString(),
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
                                controller: mother_name
                                  ..text =
                                      widget.passport.mother_name.toString(),
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
                                controller: religion
                                  ..text = widget.passport.religion.toString(),
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
                                controller: blood_group
                                  ..text =
                                      widget.passport.blood_group.toString(),
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
                                controller: email
                                  ..text = widget.passport.email.toString(),
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
                                controller: marital_status
                                  ..text =
                                      widget.passport.marital_status.toString(),
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
                              Text(
                                  'Previous Stay in Nepal / अघिल्लो नेपाल बसाइ'),
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
                                                controller: visatype
                                                  ..text = widget
                                                      .passport.visatype
                                                      .toString(),
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
                                                controller: duration
                                                  ..text = widget
                                                      .passport.visaduration
                                                      .toString(),
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
                                                controller: to
                                                  ..text = widget
                                                      .passport.visato
                                                      .toString(),
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
                                                controller: working_organization
                                                  ..text = widget.passport
                                                      .working_organization
                                                      .toString(),
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
                                                controller: remarks
                                                  ..text = widget
                                                      .passport.remarks
                                                      .toString(),
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
                                      ? 'Required / आवश्यक'
                                      : null;
                                },
                                controller: passport_number
                                  ..text = widget.passport.passport_number
                                      .toString(),
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
                                controller: validityofvisa
                                  ..text =
                                      widget.passport.validityofvisa.toString(),
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
                                controller: currentvisatype
                                  ..text = widget.passport.currentvisatype
                                      .toString(),
                                keyboardType: TextInputType.text,
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
                              TextFormField(
                                validator: (value) {
                                  return value!.isEmpty
                                      ? 'Required / आवश्यक'
                                      : null;
                                },
                                controller: dateofissues
                                  ..text =
                                      widget.passport.dateofissues.toString(),
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Date Of Issues / जारी मिति',
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
                                controller: dateofexpiry
                                  ..text =
                                      widget.passport.dateofexpiry.toString(),
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Date Of Expiry / म्याद सकिने दिन',
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
                                controller: degree
                                  ..text = widget.passport.degree.toString(),
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
                                controller: university
                                  ..text =
                                      widget.passport.university.toString(),
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
                                controller: division
                                  ..text = widget.passport.division.toString(),
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
                                controller: passedyear
                                  ..text =
                                      widget.passport.passedyear.toString(),
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
                                controller: nameOfOrganization
                                  ..text = widget.passport.nameOfOrganization
                                      .toString(),
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
                                controller: addressOfOrganization
                                  ..text = widget.passport.addressOfOrganization
                                      .toString(),
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
                                controller: designation
                                  ..text =
                                      widget.passport.designation.toString(),
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
                                controller: contactNumberofOrganization
                                  ..text = widget
                                      .passport.contactNumberOfOrganization
                                      .toString(),
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
                                controller: contactEmailOfOrganization
                                  ..text = widget
                                      .passport.contactEmailOfOrganization
                                      .toString(),
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
                                controller: focalPersonOfOrganization
                                  ..text = widget
                                      .passport.focalPersonOfOrganization
                                      .toString(),
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
                                controller: telephone
                                  ..text = widget.passport.telephone.toString(),
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
                                controller: referenceName
                                  ..text =
                                      widget.passport.referenceName.toString(),
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
                                controller: referenceNumber
                                  ..text = widget.passport.referenceNumber
                                      .toString(),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText:
                                      'Reference Number / सन्दर्भ नम्बर ',
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
                                controller: passportreceived
                                  ..text = widget.passport.passportreceiveddate
                                      .toString(),
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText:
                                      'Passport Received  / राहदानी प्राप्त मिति',
                                  labelStyle: TextStyle(
                                    fontSize: labelsize,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height,
                              ),
                              TextFormField(
                                controller: passportcheckout
                                  ..text = widget.passport.passportcheckoutdate
                                      .toString(),
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText:
                                      'Passport Checkout Date  / राहदानी चेकआउट मिति ',
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
                        if (personalform.currentState!.validate()) {
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
                              passport_id: widget.passport.passport_id,
                              image: image != null
                                  ? image!.path
                                  : widget.passport.image,
                              dateofissues: dateofissues.text,
                              dateofexpiry: dateofexpiry.text,
                              passportcheckoutdate: passportcheckout.text,
                              passportreceiveddate: passportreceived.text);

                          ref
                              .read(crudProvider.notifier)
                              .editingData(passportDetails, widget.index);
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
                            "Edit",
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
