import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rohit_projectt/model/passport_model.dart';

import '../Widget/KText.dart';
import '../Widget/category.dart';

// ignore: must_be_immutable
class PassportDetails extends ConsumerStatefulWidget {
  PassportDetails({Key? key, required this.passport}) : super(key: key);
  PassportModel passport;

  @override
  ConsumerState<PassportDetails> createState() => _PassportDetailsState();
}

class _PassportDetailsState extends ConsumerState<PassportDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Center(
                      child: widget.passport.image != null
                          ? Image.file(
                              File(widget.passport.image!),
                              fit: BoxFit.cover,
                              height: 300,
                              width: 300,
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              ),
                            )),
                ),
                SizedBox(
                  height: 15,
                ),
                KText(
                    align: Alignment.topLeft,
                    title: 'Personal Details',
                    fontSize: h1,
                    fontWeight: f0),
                //personal Details
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      children: [
                        KText(
                          align: Alignment.topLeft,
                          title: 'Name',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.name}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Family Name',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.family_name}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Permanent Address',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.permanent_address}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Residental Address',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.residential_address}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Personal Number',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '+${widget.passport.personal_number}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Office',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.office_number}',
                          fontSize: h1,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Date of Birth',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.dateOfBirth}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Nationality',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.nationality}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Father Name',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.father_name}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Mother Name:',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.mother_name}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Religion',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.religion}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Blood Group',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.blood_group}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Email Address',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.email}',
                          fontSize: h1,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Marital Status',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.marital_status}',
                          fontSize: h1,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Passport No:',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.passport_number}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Validity of visa',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.validityofvisa}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Previous stay in Nepal',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Column(
                              children: [
                                Table(
                                  textBaseline: TextBaseline.alphabetic,
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  border: TableBorder.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  children: [
                                    TableRow(children: [
                                      Column(children: [
                                        Text(
                                          'SN',
                                        )
                                      ]),
                                      Column(children: [
                                        Text(
                                          'Visa Types',
                                        )
                                      ]),
                                      Column(children: [
                                        Text(
                                          'Duration From ',
                                        )
                                      ]),
                                      Column(children: [
                                        Text(
                                          'Duration To',
                                        )
                                      ]),
                                      Column(children: [
                                        Text(
                                          'Organization,if working',
                                          softWrap: true,
                                        )
                                      ]),
                                      Column(children: [
                                        Text(
                                          'Remarks',
                                        )
                                      ]),
                                    ]),
                                    TableRow(children: [
                                      Column(children: [Text('1')]),
                                      Column(children: [
                                        Text('${widget.passport.visatype}')
                                      ]),
                                      Column(children: [
                                        Text('${widget.passport.visaduration}')
                                      ]),
                                      Column(children: [
                                        Text('${widget.passport.visato}')
                                      ]),
                                      Column(children: [
                                        Text(
                                            '${widget.passport.working_organization}')
                                      ]),
                                      Column(children: [
                                        Text('${widget.passport.remarks}')
                                      ]),
                                    ])
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                KText(
                  align: Alignment.topLeft,
                  title: 'Education Qualification',
                  fontSize: 15,
                  fontWeight: f0,
                ),

                //education Qualification
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      children: [
                        Table(
                          textBaseline: TextBaseline.alphabetic,
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          border: TableBorder.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 2),
                          children: [
                            TableRow(children: [
                              Column(children: [
                                Text(
                                  'Degree',
                                )
                              ]),
                              Column(children: [
                                Text(
                                  'University',
                                )
                              ]),
                              Column(children: [
                                Text(
                                  'Rank',
                                )
                              ]),
                              Column(children: [
                                Text(
                                  'Passed Year',
                                )
                              ]),
                            ]),
                            TableRow(children: [
                              Column(children: [
                                Text('${widget.passport.degree}')
                              ]),
                              Column(children: [
                                Text('${widget.passport.university}')
                              ]),
                              Column(children: [
                                Text('${widget.passport.division}')
                              ]),
                              Column(children: [
                                Text('${widget.passport.passedyear}')
                              ]),
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                KText(
                  align: Alignment.topLeft,
                  title: 'Working Organization',
                  fontSize: h1,
                  fontWeight: f0,
                ),
                //Business details
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      children: [
                        KText(
                          align: Alignment.topLeft,
                          title: 'Name of Organization:',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.nameOfOrganization}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Address of Organization',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.addressOfOrganization}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Designation',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.designation}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Contact Number of Organization',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title:
                              '${widget.passport.contactNumberOfOrganization}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Contact Email of Organization',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title:
                              '${widget.passport.contactEmailOfOrganization}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Focal Person of Organization',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.focalPersonOfOrganization}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Telephone or contact person',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.telephone}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                      ],
                    ),
                  ),
                ),
                KText(
                  align: Alignment.topLeft,
                  title: 'References',
                  fontSize: h1,
                  fontWeight: f0,
                ),
                //References details
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      children: [
                        KText(
                          align: Alignment.topLeft,
                          title: 'Reference Name:',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.referenceName}',
                          fontSize: h1,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Reference Number:',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.referenceNumber}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                      ],
                    ),
                  ),
                ),
                KText(
                  align: Alignment.topLeft,
                  title: 'Checkout Details',
                  fontSize: h1,
                  fontWeight: f0,
                ),
                //References details
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      children: [
                        KText(
                          align: Alignment.topLeft,
                          title: 'Passport Received Date:',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.passportreceiveddate}',
                          fontSize: h1,
                          fontWeight: f2,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: 'Passport Checout Date:',
                          fontSize: h1,
                          fontWeight: f1,
                        ),
                        KText(
                          align: Alignment.topLeft,
                          title: '${widget.passport.passportcheckoutdate}',
                          fontSize: h2,
                          fontWeight: f2,
                        ),
                      ],
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
