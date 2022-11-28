import 'package:flutter/material.dart';
import 'package:rohit_projectt/Widget/KText.dart';
import 'package:rohit_projectt/Widget/category.dart';

class CheckScreen extends StatefulWidget {
  CheckScreen({Key? key}) : super(key: key);

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Container(
                  //   width: 300,
                  //   height: 300,
                  //   child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(20),
                  //       child: Center(
                  //           child: widget.passport.image != null
                  //               ? Image.file(
                  //                   File(widget.passport.image!),
                  //                   fit: BoxFit.cover,
                  //                   width: 300,
                  //                   height: 300,
                  //                 )
                  //               : Image.asset("assets/formal.png"))),
                  // ),
                  //        Center(
                  //   child: Image.asset(
                  //     'assets/passport.png',
                  //     width: 100,
                  //     height: 100,
                  //     fit: BoxFit.contain,
                  //   ),
                  // ),
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
                            title: 'Ranjan Kumar',
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
                            title: 'Thakur',
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
                            title: 'Saptari',
                            fontSize: h2,
                            fontWeight: f2,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: 'Residental',
                            fontSize: h1,
                            fontWeight: f1,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: 'Kathmandu',
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
                            title: '+97083883',
                            fontSize: h2,
                            fontWeight: f2,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: '+offiec',
                            fontSize: h1,
                            fontWeight: f1,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: '+97083883',
                            fontSize: h1,
                            fontWeight: f2,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: '+Date of birth',
                            fontSize: h1,
                            fontWeight: f1,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: '+NOV 23',
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
                            title: 'Nepalese',
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
                            title: 'Om prakash thakur',
                            fontSize: h2,
                            fontWeight: f2,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: '+Mother Name:',
                            fontSize: h1,
                            fontWeight: f1,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: '+Bimala Devi',
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
                            title: 'Free thinker',
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
                            title: 'O+',
                            fontSize: h2,
                            fontWeight: f2,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: '+Email Address',
                            fontSize: h1,
                            fontWeight: f1,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: 'tranjan638@gmail.com',
                            fontSize: h1,
                            fontWeight: f2,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: '+Matiral Status',
                            fontSize: h1,
                            fontWeight: f1,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: '+UnMarried',
                            fontSize: h1,
                            fontWeight: f2,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: '+Passport No:',
                            fontSize: h1,
                            fontWeight: f1,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: '8979823',
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
                            title: '18 Nov 2022',
                            fontSize: h2,
                            fontWeight: f2,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: 'Previous stay in Nepal',
                            fontSize: h1,
                            fontWeight: f1,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: 'Yes',
                            fontSize: h1,
                            fontWeight: f2,
                          ),
                          //table for the storage of the previous stay in Nepal
                          // Table(children: [TableRow()]),
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
                                        Column(children: [Text('Javatpoint')]),
                                        Column(children: [Text('Flutter')]),
                                        Column(children: [Text('5*')]),
                                        Column(children: [Text('Javatpoint')]),
                                        Column(children: [Text('Flutter')]),
                                        Column(children: [Text('5*')]),
                                      ]),
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
                                Column(children: [Text('Javatpoint')]),
                                Column(children: [Text('Flutter')]),
                                Column(children: [Text('5*')]),
                                Column(children: [Text('Javatpoint')]),
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
                            title: 'CSCEC',
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
                            title: 'Bhatbhateni, Naxal, Kathmandu',
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
                            title: 'Quality Surveyor',
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
                            title: '89029394',
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
                            title: 'kumar.poald@ml.com',
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
                            title: 'Kumar Pokrel',
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
                            title: '0439',
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
                            title: 'Sadikshya Amgain',
                            fontSize: h1,
                            fontWeight: f2,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: '9809234',
                            fontSize: h2,
                            fontWeight: f2,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: 'Laxmi Poudel',
                            fontSize: h1,
                            fontWeight: f2,
                          ),
                          KText(
                            align: Alignment.topLeft,
                            title: '94943',
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
      ),
    );
  }
}
