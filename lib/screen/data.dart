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

class BackendService {
  Future<ValueListenableBuilder<Box>> getSuggestions(String query) async {
    final passportBox = Hive.box('passport');

    return ValueListenableBuilder(
        valueListenable: passportBox.listenable(),
        builder: (context, passport, _) {
          return ListView.builder(
            itemCount: passportBox.length,
            itemBuilder: (context, index) {
              final passportdetails = passportBox.getAt(index) as PassportModel;
              return Slidable(
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) async {},
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                      borderRadius: BorderRadius.circular(10),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => EditPassportDetails(
                        //               passport: passportdetails,
                        //               index: index,
                        //             )));
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
                      onPressed: (context) async {},
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.notification_add_outlined,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SlidableAction(
                      onPressed: (context) async {},
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
                          query,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
