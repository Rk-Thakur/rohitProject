import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rohit_projectt/Widget/textformfield.dart';
import 'package:rohit_projectt/model/passport_model.dart';

import '../Widget/category.dart';
import '../provider/image_provider.dart';

class EditForm extends ConsumerStatefulWidget {
  EditForm({Key? key, this.passport, this.index}) : super(key: key);
  final PassportModel? passport;
  final int? index;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<EditForm> {
  int _activeCurrentStep = 0;
  var stay_previous = ['Yes', 'No'];

  DateTime dateOfBirth = DateTime(2022, 12, 24);
  DateTime visaduration = DateTime(2022, 12, 24);
  DateTime visato = DateTime(2022, 12, 24);
  DateTime passedYear = DateTime(2022, 12, 24);
  String? previous;
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
                    controller: TextForm().name
                      ..text = widget.passport!.name.toString(),
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
                    controller: TextForm().family_name
                      ..text = widget.passport!.name.toString(),
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
                    controller: TextForm().permanent_address,
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
                    controller: TextForm().residential_address,
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
                    controller: TextForm().personal_number,
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
                    controller: TextForm().office_number,
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
                    controller: TextForm().dateOfBirth,
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
                    controller: TextForm().nationality,
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
                    controller: TextForm().father_name,
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
                    controller: TextForm().mother_name,
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
                    controller: TextForm().religion,
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
                    controller: TextForm().blood_group,
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
                    controller: TextForm().email,
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
                    controller: TextForm().marital_status,
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
                    controller: TextForm().passport_number,
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
                    controller: TextForm().validityofvisa,
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
                    controller: TextForm().currentvisatype,
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
                                          controller: TextForm().visatype,
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
                                          controller: TextForm().visaduration,
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                onPressed: () async {
                                                  DateTime? newDate =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              visaduration,
                                                          firstDate:
                                                              DateTime(1900),
                                                          lastDate:
                                                              DateTime.now());

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
                                          controller: TextForm().visato,
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                onPressed: () async {
                                                  DateTime? newDate =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              visaduration,
                                                          firstDate:
                                                              DateTime(1900),
                                                          lastDate:
                                                              DateTime.now());

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
                                          controller:
                                              TextForm().working_organization,
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
                                          controller: TextForm().remarks,
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
                                controller: TextForm().degree,
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
                                controller: TextForm().university,
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
                                controller: TextForm().division,
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
                                controller: TextForm().passedyear,
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
                      controller: TextForm().nameOfOrganization,
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
                      controller: TextForm().addressOfOrganization,
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
                      controller: TextForm().designation,
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
                      controller: TextForm().contactNumberofOrganization,
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
                      controller: TextForm().contactEmailOfOrganization,
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
                      controller: TextForm().focalPersonOfOrganization,
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
                      controller: TextForm().telephone,
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
                      controller: TextForm().referenceName,
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
                      controller: TextForm().referenceNumber,
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
              Text('Name: ${TextForm().name.text}'),
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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              height: 80,
              width: 80,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
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
                                  fit: BoxFit.fill,
                                  height: 80,
                                  width: 80,
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
                            border: Border.all(width: 2, color: Colors.white)),
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
                      if (personalform[_activeCurrentStep]
                          .currentState!
                          .validate()) {
                        _activeCurrentStep += 1;
                      }
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
