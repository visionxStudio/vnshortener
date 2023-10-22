import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final drawerControllerNotifier =
    ChangeNotifierProvider<DrawerController>((ref) => DrawerController());

class DrawerController extends ChangeNotifier {
  int selectedIndex = 0;

  bool showNotification = false;

  void changeNotification(bool value) {
    showNotification = value;

    if (!value) {
      FlutterLocalNotificationsPlugin().cancelAll();
    } else {
      FlutterLocalNotificationsPlugin().initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings(
            "ic_launcher",
          ),
        ),
      );
    }
    notifyListeners();
  }

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
