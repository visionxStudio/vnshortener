import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navbarNotifierProvider = ChangeNotifierProvider((ref) => NavbarNotifer());

class NavbarNotifer extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    log(index.toString());
    _currentIndex = index;
    notifyListeners();
  }
}
