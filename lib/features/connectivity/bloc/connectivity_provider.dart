import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final connectivityNotifierProvider =
    ChangeNotifierProvider<ConnectivityNotifier>(
        (ref) => ConnectivityNotifier());

class ConnectivityNotifier extends ChangeNotifier {
  ConnectivityNotifier() {
    scheduleMicrotask((() => checkInternetConnection()));
  }
  bool hasInternetConnection = true;
  void checkInternetConnection() async {
    InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            hasInternetConnection = true;
            notifyListeners();
            break;
          case InternetConnectionStatus.disconnected:
            hasInternetConnection = false;
            notifyListeners();
            break;
        }
      },
    );
  }
}
