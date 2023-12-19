import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:launch_app_store/launch_app_store.dart';
import 'package:likhitexam/common/constants/constants.dart';
import 'package:likhitexam/common/widgets/text/custom_normal_text_widget.dart';

class UpdateHelper {
  String currentVersion = '1.2.0+30';

  late String latestVersion;
  Future<void> getLatestAppVersion(BuildContext context) async {
    final http.Response response =
        await http.get(Uri.parse('https://top20lists.net/likhit-version.json'));
    if (response.statusCode == 200) {
      final String latestVersion = jsonDecode(response.body)['latest_version'];
      debugPrint('Latest version: $latestVersion');
      this.latestVersion = latestVersion;
      // check if the update is available
      if (isUpdateAvailable()) {
        debugPrint('Update is available!');
        // show a dialog to the user
        // ignore: use_build_context_synchronously
        showUpdateDialog(context);
      } else {
        debugPrint('No update available!');
      }
    } else {
      debugPrint('Request failed with status: ${response.statusCode}.');
    }
  }

  bool isUpdateAvailable() {
    if (latestVersion.compareTo(currentVersion) > 0) {
      return true;
    } else {
      return false;
    }
  }

  void showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const NormalText(
            'Update Available!!',
            fontSize: kDefaultFontSize + 4,
          ),
          content: const NormalText('Please update the app to continue.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // check if the platform is android or ios
                if (Platform.isAndroid) {
                  //   open the app store of android
                  LaunchReview.launch(
                    androidAppId: "com.visionxstudio.likhitexam",
                  );
                } else if (Platform.isIOS) {
                  // open the app store of ios
                  LaunchReview.launch(
                    iOSAppId: "6463439808",
                    writeReview: false,
                  );
                }
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
