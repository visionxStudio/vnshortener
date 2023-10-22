import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:likhitexam/features/navbar/navbar.dart';

final navBarProvider = ChangeNotifierProvider<NavBarNotifier>((ref) {
  return NavBarNotifier();
});

class NavBarNotifier extends ChangeNotifier {
  int index = 0;
  NavBarPage activeNavPage = NavBarPage.home;

  void indexChange(int newIndex) {
    index = newIndex;
    switch (index) {
      case 0:
        activeNavPage = NavBarPage.home;
        break;
      case 1:
        activeNavPage = NavBarPage.exam;
        break;
      case 2:
        activeNavPage = NavBarPage.settings;
        break;
    }
    notifyListeners();
  }
}
