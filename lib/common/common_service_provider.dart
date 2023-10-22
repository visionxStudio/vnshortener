import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:likhitexam/common/service/shared_pref_provider.dart';

final commonServiceProvider = ChangeNotifierProvider<CommonServiceNotifier>(
    (ref) => CommonServiceNotifier());

class CommonServiceNotifier extends ChangeNotifier {
  CommonServiceNotifier() {
    scheduleMicrotask(() => refreshUserName());
  }
  String userName = "Guest";
  String? tempName;

  void refreshUserName() {
    userName = SharedPrefProvider.instance().getString("userName")!;
    notifyListeners();
  }

  void nameChanged(String value) {
    tempName = value;
  }

  void setUserName(String name) {
    SharedPrefProvider.instance().setString("userName", name);
    refreshUserName();
  }
}
