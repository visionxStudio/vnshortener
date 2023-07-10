import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkshortener/features/root/shared_pref_provider.dart';

final selectionProvider =
    ChangeNotifierProvider((ref) => SelectionNotifierProvider());

class SelectionNotifierProvider extends ChangeNotifier {
  SelectionNotifierProvider() {
    scheduleMicrotask(() => getDefault());
  }

  int selectedIndex = -1;
  bool rememberSelection = false;
  List<String> websites = [
    "https://nestshortener.com",
    "https://vnshortener.com",
  ];

  void getDefault() async {
    if (SharedPrefProvider.instance.getBool("default") ?? false) {
      String? url = SharedPrefProvider.instance.getString("url");
      if (url != null) {
        selectedIndex = websites.indexOf(url);
        rememberSelection = true;
        notifyListeners();
      }
    }
  }

  void changeSelectedIndex(index) {
    selectedIndex = index;
    notifyListeners();
  }

  void changeRememberSelection(bool status) {
    rememberSelection = status;
    notifyListeners();
  }

  void continuePressed() {
    if (rememberSelection) {
      // save the selected index to shared preferences
      SharedPrefProvider.instance.setBool("default", true);
      SharedPrefProvider.instance.setString("url", websites[selectedIndex]);
    } else {
      // remove the selected index from shared preferences
      SharedPrefProvider.instance.remove("defalut");
    }
  }
}
