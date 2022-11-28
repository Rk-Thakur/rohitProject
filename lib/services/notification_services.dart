import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rohit_projectt/model/passport_model.dart';

import '../screen/passportt_details.dart';

class NotificationServices {
  Future<void> initialization() async {
    await AwesomeNotifications().initialize(null, [
      NotificationChannel(
          channelKey: 'key1',
          channelName: 'PassPortNofication',
          channelDescription: 'channelDescription',
          defaultColor: const Color(0XFF9850DD),
          ledColor: Colors.white,
          playSound: true,
          enableLights: true,
          enableVibration: true,
          channelShowBadge: true),
    ]);
  }

  Future<void> deletNotification(int passport_id) async {
    await AwesomeNotifications().cancel(passport_id);
  }

  Future<void> Notify({PassportModel? pasport, int? passport_id}) async {
    String timezone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: passport_id!,
        channelKey: 'key1',
        title: pasport?.name,
        body: pasport?.designation,
      ),
      schedule: NotificationInterval(
        interval: 60, timeZone: timezone, repeats: true,
        // //only take when interval is of 60 seconds
      ),
    );
  }
}
