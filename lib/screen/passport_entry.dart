import 'package:flutter/material.dart';

import 'package:rohit_projectt/Widget/build_listview.dart';
import 'package:rohit_projectt/model/passport_model.dart';
import 'package:rohit_projectt/screen/passport_form_data.dart';

import '../Widget/search_widget.dart';

class PassportPage extends StatefulWidget {
  const PassportPage({Key? key}) : super(key: key);

  @override
  State<PassportPage> createState() => _PassportPageState();
}

class _PassportPageState extends State<PassportPage> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Passport Details"),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchWidget());
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF21B7CA),
          onPressed: () {},
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const PassportFormPage()),
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Passport Details"),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(child: BuildListView()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSearch() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextFormField(
        controller: textController,
        autofocus: false,
        onChanged: (value) {
          // showSearch(context: context, delegate: SearchWidget());
        },
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xff1C1B1F),
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            labelText: 'Search',
            labelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            )),
      ),
    );
  }
}
