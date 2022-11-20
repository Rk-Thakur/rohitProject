import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../model/passport_model.dart';
import '../screen/edit_passport_details.dart';
import '../screen/passportt_details.dart';
import '../services/notification_services.dart';

// class SearchWidget extends SearchDelegate {
//   List<String> allpassport = ['a', 'c', 'cc'];
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchPassport = [];
//     for (var passport in allpassport) {
//       if (passport.toLowerCase().contains(query.toLowerCase())) {
//         matchPassport.add(passport);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchPassport.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(matchPassport[index]),
//           );
//         });
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchPassport = [];
//     for (var passport in allpassport) {
//       if (passport.toLowerCase().contains(query.toLowerCase())) {
//         matchPassport.add(passport);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchPassport.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(matchPassport[index]),
//           );
//         });
//   }

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }
// }
class SearchWidget extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // for closing the search page and going back
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchFinder(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchFinder(query: query);
  }
}

class SearchFinder extends StatefulWidget {
  const SearchFinder({Key? key, this.query}) : super(key: key);
  final String? query;

  @override
  State<SearchFinder> createState() => _SearchFinderState();
}

class _SearchFinderState extends State<SearchFinder> {
  @override
  Widget build(BuildContext context) {
    final passportBox = Hive.box('passport');

    return ValueListenableBuilder(
        valueListenable: passportBox.listenable(),
        builder: (context, Box passport, _) {
          var results = widget.query!.isEmpty
              ? passport.values.toList()
              : passport.values
                  .where((element) =>
                      element.name!.toLowerCase().contains(widget.query!))
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
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final passportdetails = results[index];
                    return InkWell(
                      onTap: () {
                        Get.to(() => PassportDetails(
                              passport: passportdetails,
                            ));
                      },
                      child: Card(
                        elevation: 3,
                        child: ListTile(
                          title: Text(passportdetails.name.toString()),
                          subtitle: Text(passportdetails.address.toString()),
                        ),
                      ),
                    );
                  },
                );
        });
  }
}
