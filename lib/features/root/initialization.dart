import 'dart:async';

import 'package:linkshortener/features/root/shared_pref_provider.dart';

class InitializationHandler {
  static Future<void> initializeStorageService() async {
    await SharedPrefProvider.initialize();

    if (!SharedPrefProvider.instance.containsKey("default")) {
      SharedPrefProvider.instance.setBool("default", false);
    }
  }
}
