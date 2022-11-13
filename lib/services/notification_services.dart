// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// class LocalNotificationService {
//   LocalNotificationService();
//   final _localNoticationServices = FlutterLocalNotificationsPlugin();
//   Future<void> initialize() async {
//     const AndroidInitializationSettings androidInitializationSettings =
//         AndroidInitializationSettings('@drawable/ic_launcher');
//     DarwinInitializationSettings iosInitializationSettings =
//         DarwinInitializationSettings(
//             requestAlertPermission: true,
//             requestBadgePermission: true,
//             requestSoundPermission: true,
//             onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//     final InitializationSettings settings = InitializationSettings(
//         android: androidInitializationSettings, iOS: iosInitializationSettings);
//     await _localNoticationServices.initialize(settings,
//         onDidReceiveBackgroundNotificationResponse: onSelectNotification);
//   }
//   Future<NotificationDetails> _notificationDetails() async {
//     final androidNotificationDetails = AndroidNotificationDetails(
//       'channelId',
//       'channelName',
//       channelDescription: 'channelDescription',
//       importance: Importance.max,
//       playSound: true,
//     );
//     final iosNotificationDetails = DarwinNotificationDetails();
//     return NotificationDetails(
//         android: androidNotificationDetails, iOS: iosNotificationDetails);
//   }
//   Future<void> showNotification(
//       {required int id, required String title, required String body}) async {
//     final details = await _notificationDetails();
//     await _localNoticationServices.show(id, title, body, details);
//   }
//   void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) {}
//   void onSelectNotification(NotificationResponse details) {
//     print('Payloads $details');
//   }
// }

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationServices {
  Future<void> initialization() async {
    await AwesomeNotifications().initialize(null, [
      NotificationChannel(
          channelKey: 'key1',
          channelName: 'PassPortNofication',
          channelDescription: 'channelDescription',
          defaultColor: Color(0XFF9850DD),
          ledColor: Colors.white,
          playSound: true,
          locked: true,
          enableLights: true,
          enableVibration: true,
          channelShowBadge: true),
    ]);
  }

  // ignore: non_constant_identifier_names
  void Notify({String? name, String? image, int? id
      //pass dateandtime from the user created form
      }) async {
    String timezone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id!,
        channelKey: 'key1',
        title: name,
        body: 'this is body ofo Notifications',
        bigPicture:
            'https://media.istockphoto.com/photos/tiger-with-black-background-picture-id1325236897?b=1&k=20&m=1325236897&s=170667a&w=0&h=qybnB6aIjksxmCAMvVWtRI7_4rdj3eTSeIFLJEv0EKU=',
        notificationLayout: NotificationLayout.BigPicture,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
        )
      ],
      schedule: NotificationInterval(
          interval: 60, timeZone: timezone, repeats: true, preciseAlarm: true
          // //only take when interval is of 60 seconds
          ),

      // schedule: NotificationCalendar.fromDate(
      //   repeats: true,
      //   date: DateTime.now(),
      // ),
    );
  }
}
