import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rohit_projectt/model/passport_model.dart';
import 'package:rohit_projectt/provider/crud_provider.dart';
import 'package:rohit_projectt/screen/edit_passport_details.dart';
import 'package:rohit_projectt/screen/passportt_details.dart';

import '../services/notification_services.dart';

class BuildListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool? isNotified;
    bool? tag;
    final passportBox = Hive.box('passport');

    return ValueListenableBuilder(
        valueListenable: passportBox.listenable(),
        builder: (context, passport, _) {
          return passportBox.isEmpty
              ? const Center(
                  child: Text(
                    'No Data!!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: passportBox.length,
                  itemBuilder: (context, index) {
                    final passportdetails =
                        passportBox.getAt(index) as PassportModel;
                    return InkWell(
                      onDoubleTap: () async {
                        ref.read(crudProvider.notifier).deleteData(index);
                        if (isNotified == true) {
                          NotificationServices()
                              .deletNotification(passportdetails.passport_id!);
                          Get.snackbar("Notification Update",
                              'Notification has been Deleted!!');
                        }
                      },
                      onTap: () {
                        Get.to(() => PassportDetails(
                              passport: passportdetails,
                            ));
                      },
                      child: Slidable(
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            // SlidableAction(
                            //   onPressed: (context) async {
                            //     ref
                            //         .read(crudProvider.notifier)
                            //         .deleteData(index);
                            //     if (isNotified == true) {
                            //       NotificationServices().deletNotification(
                            //           passportdetails.passport_id!);
                            //       Get.snackbar("Notification Update",
                            //           'Notification has been Deleted!!');
                            //     }
                            //   },
                            //   backgroundColor: const Color(0xFFFE4A49),
                            //   foregroundColor: Colors.white,
                            //   icon: Icons.delete,
                            //   label: 'Delete',
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            // const SizedBox(
                            //   width: 4,
                            // ),
                            SlidableAction(
                              onPressed: (context) async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditPassportDetails(
                                              passportdetails,
                                              index,
                                            )));
                              },
                              backgroundColor: const Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Edit',
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ],
                        ),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) async {
                                await NotificationServices().Notify(
                                    pasport: passportdetails,
                                    passport_id: passportdetails.passport_id);
                                Get.snackbar("Notification Update",
                                    'Notification has been set up!!!');
                                isNotified = true;
                                tag = true;
                              },
                              backgroundColor: const Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.notification_add_outlined,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            SlidableAction(
                              onPressed: (context) async {
                                if (isNotified != true) {
                                  Get.snackbar("Notification Update",
                                      'Notification has not been setup!!!',
                                      duration: const Duration(
                                        seconds: 2,
                                      ));
                                } else {
                                  await NotificationServices()
                                      .deletNotification(
                                          passportdetails.passport_id!);
                                  Get.snackbar("Notification Update",
                                      'Notification has been Deleted!!');
                                  isNotified = false;
                                }
                              },
                              backgroundColor: const Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.notification_important_outlined,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ],
                        ),
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    passportdetails.name.toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle:
                                  Text(passportdetails.degree.toString())),
                        ),
                      ),
                    );
                  },
                );
        });
  }
}
