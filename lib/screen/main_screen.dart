import 'package:flutter/material.dart';
import 'package:popup_card/popup_card.dart';
import 'package:rohit_projectt/services/notification_services.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    Future<void> _selectedDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2016, 7),
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    // return Scaffold(
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       showDialog(
    //           context: context,
    //           builder: (BuildContext context) {
    //             return form(context);
    //           });
    //     },
    //     child: Icon(Icons.add),
    //   ),
    //   body: SafeArea(
    //     child: Expanded(
    //         child: Container(
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             ...[1, 2, 3].map((e) => ListTile(
    //                   title: Text('ranjan'),
    //                   subtitle: Text("ThakuThakurThakurThakurr"),
    //                 ))
    //           ],
    //         ),
    //       ),
    //     )),
    //   ),
    // );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  NotificationServices().Notify(name: 'ranjan');
                },
                child: Icon(Icons.message))
          ],
        ),
      ),
    );
  }
}
