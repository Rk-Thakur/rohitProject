// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:rohit_projectt/screen/edit_passport_details.dart';
// import 'package:rohit_projectt/screen/passportt_details.dart';
// import 'package:rohit_projectt/services/db_services.dart';

// import '../model/passport_model.dart';

// class BuildList extends StatefulWidget {
//   const BuildList({Key? key}) : super(key: key);

//   @override
//   State<BuildList> createState() => _BuildListState();
// }

// class _BuildListState extends State<BuildList> {
//   final passportBox = Hive.box('passport');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(),
//           Expanded(
//               child: ValueListenableBuilder(
//                   valueListenable: passportBox.listenable(),
//                   builder: (context, passport, _) {
//                     return ListView.builder(
//                       itemCount: passportBox.length,
//                       itemBuilder: (context, index) {
//                         final passportdetails =
//                             passportBox.getAt(index) as PassportModel;
//                         return InkWell(
//                           onTap: () {
//                             Get.to(() =>
//                                 PassportDetails(passport: passportdetails));
//                           },
//                           child: Slidable(
//                             startActionPane: ActionPane(
//                                 motion: const ScrollMotion(),
//                                 children: [
//                                   SlidableAction(
//                                     onPressed: (context) {
//                                       DBServices().delete(index);
//                                     },
//                                     backgroundColor: const Color(0xFFFE4A49),
//                                     foregroundColor: Colors.white,
//                                     icon: Icons.delete,
//                                     label: 'Delete',
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   const SizedBox(
//                                     width: 4,
//                                   ),
//                                   SlidableAction(
//                                     onPressed: (context) {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   EditPassportDetails(
//                                                     passport: passportdetails,
//                                                     index: index,
//                                                   )));
//                                     },
//                                     backgroundColor: const Color(0xFF21B7CA),
//                                     foregroundColor: Colors.white,
//                                     icon: Icons.edit,
//                                     label: 'Edit',
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ]),
//                             child: Card(
//                               elevation: 3,
//                               child: ListTile(
//                                 title: Text(passportdetails.name.toString()),
//                                 subtitle:
//                                     Text(passportdetails.address.toString()),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }))
//         ],
//       ),
//     );
//   }
// }
