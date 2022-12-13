import 'package:flutter/material.dart';

import 'package:rohit_projectt/Widget/build_listview.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Passport Details"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchWidget());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF21B7CA),
        onPressed: () {},
        child: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const PassportFormPage()),
            );
          },
          icon: const Icon(
            Icons.add,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(child: BuildListView()),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
