import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:likhitexam/app_localization.dart';
import 'package:likhitexam/common/common_service_provider.dart';
import 'package:likhitexam/common/constants/constants.dart';
import 'package:likhitexam/common/widgets/input_field/minimal_input_field.dart';
import 'package:likhitexam/common/widgets/size/custom_size_widget.dart';
import 'package:likhitexam/common/widgets/text/custom_normal_text_widget.dart';
import 'package:likhitexam/common/widgets/toast/flutter_toast.dart';
import 'package:likhitexam/features/settings_screen/widgets/setting_subtitle_widget.dart';
import 'package:likhitexam/features/settings_screen/widgets/settings_heading_widget.dart';
import 'package:likhitexam/routes/app_router.gr.dart';

import '../../common/service/shared_pref_provider.dart';
import '../../common/utils/app_size_utils.dart';
import '../../locale_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({
    Key? key,
    this.showAppbar = false,
  }) : super(key: key);

  final bool showAppbar;

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends ConsumerState<SettingsScreen> {
  final double spacingSize = 14.0;

  Future<void> changeNameDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          title: const Text('Change Your Name'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Enter your name:'),
                const HeightWidget(16.0),
                MinimalInputField(
                  hintText: "e.g. John Smith",
                  backgroundColor: kGreyColor.withOpacity(0.1),
                  onChanged: ref.read(commonServiceProvider).nameChanged,
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: kGreyColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                if (ref.read(commonServiceProvider).tempName != null) {
                  if (ref.read(commonServiceProvider).tempName!.isNotEmpty) {
                    ref
                        .read(commonServiceProvider)
                        .setUserName(ref.read(commonServiceProvider).tempName!);
                    Fluttertoast.showToast(
                      msg: "Name Changed",
                      toastLength: Toast.lengthShort,
                    );
                    Navigator.of(context).pop();
                  } else {
                    Fluttertoast.showToast(
                      msg: "Empty Name!",
                      toastLength: Toast.lengthShort,
                    );
                  }
                } else {
                  Fluttertoast.showToast(
                    msg: "Please enter your name!",
                    toastLength: Toast.lengthShort,
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppbar
          ? AppBar(
              backgroundColor: kWhiteColor,
              leading: const BackButton(
                color: kBlackColor,
              ),
              elevation: 0.0,
            )
          : null,
      backgroundColor: kgreyColorLight,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NormalText(
                "setting.setting".tr(context),
                fontSize: kDefaultFontSize * 2,
                fontWeight: FontWeight.w500,
              ),
              const HeightWidget(16.0),

              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    SettingsHeadingWidget(
                      icon: FlutterRemix.account_circle_line,
                      title: "setting.account".tr(context),
                    ),
                    HeightWidget(spacingSize),
                    HeightWidget(spacingSize),
                    SettingSubtitleWidget(
                      isSwitch: false,
                      icon: FlutterRemix.account_circle_line,
                      onTap: () {
                        changeNameDialog();
                      },
                      title: "setting.name".tr(context),
                    ),
                    const Divider(
                      color: kBlackColor,
                      height: 2,
                    ),
                    HeightWidget(spacingSize),
                    SettingSubtitleWidget(
                      icon: Icons.privacy_tip_outlined,
                      isSwitch: false,
                      onTap: () {
                        context.router.push(const PrivacyScreenRoute());
                      },
                      title: "setting.privacy".tr(context),
                    ),
                  ],
                ),
              ),

              HeightWidget(spacingSize),
              // const HeightWidget(16.0),

              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    SettingsHeadingWidget(
                      icon: FlutterRemix.external_link_line,
                      title: "setting.Miscellaneous".tr(context),
                    ),
                    HeightWidget(spacingSize),
                    HeightWidget(spacingSize),
                    SettingSubtitleWidget(
                      isSwitch: false,
                      icon: Icons.translate,
                      onTap: () {
                        showModalBottomSheet(
                          barrierColor: kLightGrey.withOpacity(0.6),
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          context: context,
                          builder: (context) {
                            return Container(
                              height: height(250),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              decoration: const BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const HeightWidget(8.0),
                                  Align(
                                    child: NormalText(
                                      "setting.change_language".tr(context),
                                      color: kPrimaryColor,
                                      isBold: true,
                                      fontSize: kDefaultFontSize - 4,
                                      isCentered: true,
                                    ),
                                  ),
                                  const HeightWidget(8.0),
                                  LanguageWidget(
                                    title: "English",
                                    isSelected: SharedPrefProvider.instance()
                                            .getInt("localIndex") ==
                                        1,
                                    onTap: () {
                                      SharedPrefProvider.instance()
                                          .setInt("localIndex", 1);
                                      ref
                                          .read(localeProvider.notifier)
                                          .saveLocale(
                                            Locale(
                                              supportedLocale[1],
                                            ),
                                          );
                                    },
                                  ),
                                  LanguageWidget(
                                    title: "Nepali",
                                    isSelected: SharedPrefProvider.instance()
                                            .getInt("localIndex") ==
                                        0,
                                    onTap: () {
                                      SharedPrefProvider.instance()
                                          .setInt("localIndex", 0);
                                      ref
                                          .read(localeProvider.notifier)
                                          .saveLocale(
                                            Locale(
                                              supportedLocale[0],
                                            ),
                                          );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      title: "setting.language".tr(context),
                    ),
                    const Divider(
                      color: kLightGreyColor,
                      height: 2,
                    ),
                    // HeightWidget(spacingSize),
                    // SettingSubtitleWidget(
                    //   icon: Icons.info_outline,
                    //   isSwitch: false,
                    //   onTap: () {
                    //     context.router.push(const AboutUsScreenRoute());
                    //   },
                    //   title: "setting.about".tr(context),
                    // ),
                    // const Divider(
                    //   color: kLightGreyColor,
                    //   height: 2,
                    // ),
                    HeightWidget(spacingSize),
                    SettingSubtitleWidget(
                      icon: Icons.notifications_outlined,
                      isSwitch: true,
                      onTap: () {},
                      title: "setting.notification".tr(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const LanguageWidget({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.0,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: isSelected ? kScaffoldBackgroundColor : kWhiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NormalText(
                  title,
                  color: kbuttonsheetText,
                )
              ],
            ),
          ),
          Container(
            height: 1.0,
            width: double.infinity,
            color: kScaffoldBackgroundColor,
          ),
        ],
      ),
    );
  }
}
