import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rohit_projectt/Widget/textformfield.dart';

import '../Widget/category.dart';
import '../provider/image_provider.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  int _activeCurrentStep = 0;
  var stay_previous = ['Yes', 'No'];

  DateTime dateOfBirth = DateTime(2022, 12, 24);
  DateTime visaduration = DateTime(2022, 12, 24);
  DateTime visato = DateTime(2022, 12, 24);
  DateTime passedYear = DateTime(2022, 12, 24);
  String? previous;
  TextEditingController name = TextEditingController();
  TextEditingController family_name = TextEditingController();
  TextEditingController permanent_address = TextEditingController();
  TextEditingController residential_address = TextEditingController();
  TextEditingController personal_number = TextEditingController();
  TextEditingController office_number = TextEditingController();
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
  List<GlobalKey<FormState>> personalform = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  List<Step> stepList() => [
        Step(
          state:
              _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: const Text('Personal Information'),
          content: SingleChildScrollView(
            child: Form(
              key: personalform[0],
              child: Column(
                children: [
                  SizedBox(
                    height: height,
                  ),
                  TextFormField(
                    validator: (value) {
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
                    },
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );

                            if (newDate == null) {
                              return;
                            }
                            setState(() {
                              dateOfBirth = newDate;
                            });
                          },
                          icon: Icon(Icons.date_range)),
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
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                      return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                  ListTile(
                    title: Text("Yes"),
                    leading: Radio(
                        value: 'Yes',
                        groupValue: previous,
                        onChanged: (value) {
                          setState(() {
                            previous = value.toString();
                          });
                        }),
                  ),
                  ListTile(
                    title: Text("No"),
                    leading: Radio(
                        value: 'No',
                        groupValue: previous,
                        onChanged: (value) {
                          setState(() {
                            previous = value.toString();
                          });
                        }),
                  ),
                  previous == 'Yes'
                      ? Container(
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
                                          validator: (value) {
                                            return value!.isEmpty
                                                ? 'Required / आवश्यक'
                                                : null;
                                          },
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
                                          validator: (value) {
                                            return value!.isEmpty
                                                ? 'Required / आवश्यक'
                                                : null;
                                          },
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                onPressed: () async {
                                                  DateTime? newDate =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime(1900),
                                                          lastDate:
                                                              DateTime(2100));

                                                  if (newDate == null) {
                                                    return;
                                                  }
                                                  setState(() {
                                                    visaduration = newDate;
                                                  });
                                                },
                                                icon: Icon(Icons.date_range)),
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
                                          validator: (value) {
                                            return value!.isEmpty
                                                ? 'Required / आवश्यक'
                                                : null;
                                          },
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                onPressed: () async {
                                                  DateTime? newDate =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime(1900),
                                                          lastDate:
                                                              DateTime(2100));

                                                  if (newDate == null) {
                                                    return;
                                                  }
                                                  setState(() {
                                                    visato = newDate;
                                                  });
                                                },
                                                icon: Icon(Icons.date_range)),
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
                                          validator: (value) {
                                            return value!.isEmpty
                                                ? 'Required / आवश्यक'
                                                : null;
                                          },
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
                                          validator: (value) {
                                            return value!.isEmpty
                                                ? 'Required / आवश्यक'
                                                : null;
                                          },
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
                      : Container()
                ],
              ),
            ),
          ),
        ),
        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 1,
            title: const Text('Education Qualification'),
            content: Container(
              child: SingleChildScrollView(
                child: Form(
                  key: personalform[1],
                  child: Column(
                    children: [
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
                                  suffixIcon: IconButton(
                                      onPressed: () async {
                                        DateTime? newDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: visaduration,
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime.now());

                                        if (newDate == null) {
                                          return;
                                        }
                                        setState(() {
                                          passedYear = newDate;
                                        });
                                      },
                                      icon: Icon(Icons.date_range)),
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
                              // Align(
                              //     alignment: Alignment.bottomRight,
                              //     child: ElevatedButton(
                              //         onPressed: () {}, child: Text("More")))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        Step(
            state: _activeCurrentStep <= 2
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 2,
            title: const Text('Professional description  / व्यावसायिक विवरण '),
            content: SingleChildScrollView(
              child: Form(
                key: personalform[2],
                child: Column(
                  children: [
                    SizedBox(
                      height: height,
                    ),
                    TextFormField(
                      validator: (value) {
                        return value!.isEmpty ? 'Required / आवश्यक' : null;
                      },
                      controller: nameOfOrganization,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name of Organization /  कार्यालयको नाम ',
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
                        return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                        return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                        return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                        return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                        return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                        return value!.isEmpty ? 'Required / आवश्यक' : null;
                      },
                      controller: telephone,
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
            )),
        Step(
            state: _activeCurrentStep <= 3
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 3,
            title: const Text('Reference / सन्दर्भ'),
            content: SingleChildScrollView(
              child: Form(
                key: personalform[3],
                child: Column(
                  children: [
                    SizedBox(
                      height: height,
                    ),
                    TextFormField(
                      validator: (value) {
                        return value!.isEmpty ? 'Required / आवश्यक' : null;
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
                        return value!.isEmpty ? 'Required / आवश्यक' : null;
                      },
                      controller: referenceNumber,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Reference Number / सन्दर्भ नम्बर ',
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
            )),
        Step(
          state: StepState.complete,
          isActive: _activeCurrentStep >= 4,
          title: const Text('Confirm'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Name: ${name.text}'),
              Text('Please check every details'),
            ],
          ),
        )
      ];

  @override
  Widget build(BuildContext context) {
    final image = ref.watch(imageProvider).image;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () async {
                  ref.read(imageProvider).getImage();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  height: 150,
                  width: 150,
                  child: Positioned(
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
                                  File(image.path),
                                  fit: BoxFit.fitWidth,
                                  height: 150,
                                  width: 150,
                                ),
                              ),
                            )),
                ),
              ),
            ),
            Expanded(
              child: Stepper(
                elevation: 3,
                type: StepperType.vertical,
                currentStep: _activeCurrentStep,
                steps: stepList(),

                // onStepContinue takes us to the next step
                onStepContinue: () {
                  final isLastStep =
                      _activeCurrentStep == stepList().length - 1;
                  if (_activeCurrentStep < (stepList().length - 1)) {
                    setState(() {
                      _activeCurrentStep += 1;
                    });
                  }
                  if (isLastStep) {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    //   return const Checking();
                    // }));
                    print('last step');
                  }
                },

                // onStepCancel takes us to the previous step
                onStepCancel: () {
                  if (_activeCurrentStep == 0) {
                    return;
                  }

                  setState(() {
                    _activeCurrentStep -= 1;
                  });
                },

                // onStepTap allows to directly click on the particular step we want
                onStepTapped: (int index) {
                  setState(() {
                    _activeCurrentStep = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
