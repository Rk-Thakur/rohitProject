import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rohit_projectt/screen/passportt_details.dart';

import '../model/passport_model.dart';
import '../screen/edit_passport_details.dart';
import '../services/db_services.dart';

class SearchFinder extends StatelessWidget {
  SearchFinder({Key? key, this.query}) : super(key: key);
  final String? query;
  @override
  Widget build(BuildContext context) {
    final passportBox = Hive.box('passport');
    return ValueListenableBuilder(
        valueListenable: passportBox.listenable(),
        builder: (context, Box passport, _) {
          var results = query!.isEmpty
              ? passportBox.values.toList()
              : passportBox.values
                  .where(
                      (element) => element.name!.toLowerCase().contains(query!))
                  .toList();
          return results.isEmpty
              ? Center(
                  child: Text(
                    'No results found !',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                )
              : ListView.builder(
                  itemCount: passportBox.length,
                  itemBuilder: (context, index) {
                    final passportdetails =
                        passportBox.getAt(index) as PassportModel;
                    return InkWell(
                      onTap: () {
                        Get.to(
                            () => PassportDetails(passport: passportdetails));
                      },
                      child: Slidable(
                        startActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          SlidableAction(
                            onPressed: (context) {
                              DBServices().delete(index);
                            },
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditPassportDetails(
                                            passport: passportdetails,
                                            index: index,
                                          )));
                            },
                            backgroundColor: const Color(0xFF21B7CA),
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'Edit',
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ]),
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(passportdetails.name.toString()),
                            subtitle: Text(passportdetails.address.toString()),
                          ),
                        ),
                      ),
                    );
                  },
                );
        });
  }
}
