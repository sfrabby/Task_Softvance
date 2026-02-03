import 'dart:typed_data';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final _notification = FlutterLocalNotificationsPlugin();

  // ১. ইনিশিয়ালাইজেশন
  static Future init() async {
    tz.initializeTimeZones();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await _notification.initialize(settings);
  }

  // ২. অ্যালার্ম সিডিউল করা
  static Future scheduleNotification(int id, String time, DateTime scheduledDate) async {
    final Int64List vibrationPattern = Int64List.fromList([0, 1000, 500, 2000]);

    await _notification.zonedSchedule(
      id,
      'Travel Alarm: $time',
      'আপনার যাত্রার সময় হয়ে গেছে!',
      tz.TZDateTime.from(scheduledDate, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          'alarm_channel',
          'Travel Alarms',
          importance: Importance.max,
          priority: Priority.high,
          vibrationPattern: vibrationPattern,
          enableVibration: true,
          fullScreenIntent: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  // ৩. অ্যালার্ম ক্যানসেল করা (এই ফাংশনটি ক্লাসের ভেতরে থাকতে হবে)
  static Future cancelNotification(int id) async {
    await _notification.cancel(id);
  }
} // <-- ক্লাসের ব্র্যাকেট এখানে শেষ হবে