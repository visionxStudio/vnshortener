import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest.dart' as tz;
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;

Future initializetimezone() async {
  tz.initializeTimeZones();
}

tz.TZDateTime _scheduleDaily(Time time) {
  final now = tz.TZDateTime.now(tz.local);
  final scheduledDate = tz.TZDateTime(
    tz.local,
    now.year,
    now.month,
    now.day,
    time.hour,
    time.minute,
    time.second,
  );

  return scheduledDate.isBefore(now)
      ? scheduledDate.add(const Duration(days: 1))
      : scheduledDate;
}

class NotificationsApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel Id',
        'channel Name',
        channelDescription: "",
        importance: Importance.max,
      ),
    );
  }

  static Future init({bool initScheduled = false}) async {
    const settings = InitializationSettings(
      android: AndroidInitializationSettings("ic_launcher"),
    );
    await _notifications.initialize(
      settings,
      // onSelectNotification: (payload) async {
      //   onNotifications.add(payload);
      // },
    );
  }

  static Future showNotifications(
          {int id = 0, String? title, String? body, String? payload}) async =>
      _notifications.show(id, title, body, await _notificationDetails(),
          payload: payload);

  static Future showScheduledNotifications(
      {int id = 0,
      String? title,
      String? body,
      String? payload,
      required DateTime scheduledDate}) async {
    await initializetimezone();
    await _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      await _notificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload,
    );
  }

  static Future showRepeatedNotifications(
      {int id = 0,
      String? title,
      String? body,
      String? payload,
      required DateTime scheduledDate}) async {
    await initializetimezone();
    await _notifications.zonedSchedule(
      id,
      title,
      body,
      _scheduleDaily(const Time(8)),
      await _notificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload,
    );
  }

  static Future cancelNotifications() {
    return _notifications.cancelAll();
  }
}
