import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../Services/Notification Service.dart';

class HomeController extends GetxController {
  final box = GetStorage(); // লোকাল ডেটাবেস
  var alarms = <Map<String, dynamic>>[].obs; // অবজারভেবল লিস্ট

  @override
  void onInit() {
    super.onInit();
    loadAlarms();
  }


  void loadAlarms() {
    List? storedAlarms = box.read<List>('alarm_list');
    if (storedAlarms != null) {
      alarms.assignAll(storedAlarms.map((e) {
        return {
          'id': e['id'],
          'time': e['time'],
          'date': e['date'],
          'isActive': (e['isActive'] as bool).obs,
        };
      }).toList());
    }
  }


  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final now = DateTime.now();
      var scheduledDate = DateTime(
        now.year, now.month, now.day, picked.hour, picked.minute,
      );


      if (scheduledDate.isBefore(now)) {
        scheduledDate = scheduledDate.add(const Duration(days: 1));
      }

      int id = scheduledDate.millisecondsSinceEpoch ~/ 1000;
      String formattedTime = DateFormat.jm().format(scheduledDate);
      String formattedDate = DateFormat('EEE d MMM yyyy').format(scheduledDate);

      var newAlarm = {
        'id': id,
        'time': formattedTime,
        'date': formattedDate,
        'isActive': true.obs,
      };

      alarms.add(newAlarm);
      saveToStorage();


      await NotificationService.scheduleNotification(id, formattedTime, scheduledDate);

      Get.snackbar(
        "Alarm Set",
        "Alarm scheduled for $formattedTime",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white24,
        colorText: Colors.white,
      );
    }
  }

  // ৩. অ্যালার্ম অন/অফ করা (Switch Toggle)
  void toggleAlarm(int index) {
    var alarm = alarms[index];
    alarm['isActive'].value = !alarm['isActive'].value;

    if (alarm['isActive'].value) {
      // scheduleNotification(...)
    } else {
      NotificationService.cancelNotification(alarm['id']);
    }
    saveToStorage();
  }

  // ৪. লোকাল স্টোরেজে সেভ করা
  void saveToStorage() {
    List dataToSave = alarms.map((e) => {
      'id': e['id'],
      'time': e['time'],
      'date': e['date'],
      'isActive': e['isActive'].value,
    }).toList();
    box.write('alarm_list', dataToSave);
  }

  // ৫. অ্যালার্ম ডিলিট করা
  void deleteAlarm(int index) {
    NotificationService.cancelNotification(alarms[index]['id']);
    alarms.removeAt(index);
    saveToStorage();
  }
}