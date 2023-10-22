import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:likhitexam/app_localization.dart';
import 'package:likhitexam/common/constants/constants.dart';
import 'package:likhitexam/common/utils/app_size_utils.dart';
import 'package:likhitexam/common/widgets/size/custom_size_widget.dart';
import 'package:likhitexam/common/widgets/text/custom_normal_text_widget.dart';
import 'package:likhitexam/features/drawer/bloc/drawer_controller.dart';
import 'package:likhitexam/features/navbar/navbar_notifier.dart';
import 'package:likhitexam/routes/app_router.gr.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/app_drawer_model.dart';

class OptionItems {
  final String title;
  final IconData icon;
  final IconData activeIcon;
  final AppDrawerType type;

  OptionItems({
    required this.title,
    required this.icon,
    required this.activeIcon,
    required this.type,
  });
}

final List<OptionItems> options = [
  OptionItems(
    title: "drawer.homepage",
    icon: FlutterRemix.home_2_line,
    activeIcon: FlutterRemix.home_2_fill,
    type: AppDrawerType.home,
  ),
  OptionItems(
    title: "drawer.notification",
    icon: FlutterRemix.notification_2_line,
    activeIcon: FlutterRemix.notification_2_fill,
    type: AppDrawerType.notification,
  ),
  OptionItems(
    title: "drawer.privacy",
    icon: FlutterRemix.shield_check_line,
    activeIcon: FlutterRemix.shield_check_fill,
    type: AppDrawerType.privacyPolicy,
  ),
  OptionItems(
    title: "Feedback",
    icon: FlutterRemix.feedback_line,
    activeIcon: FlutterRemix.feedback_fill,
    type: AppDrawerType.feedback,
  ),
  // OptionItems(
  //   title: "drawer.about",
  //   icon: FlutterRemix.information_line,
  //   activeIcon: FlutterRemix.information_fill,
  //   type: AppDrawerType.about,
  // ),
  OptionItems(
    title: "drawer.rate",
    icon: FlutterRemix.star_smile_line,
    activeIcon: FlutterRemix.star_smile_fill,
    type: AppDrawerType.rateUs,
  ),
  OptionItems(
    title: "Settings",
    icon: FlutterRemix.settings_2_line,
    activeIcon: FlutterRemix.settings_2_fill,
    type: AppDrawerType.settings,
  ),
];

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key, required this.drawerController}) : super(key: key);
  final ZoomDrawerController drawerController;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      // Show SnackBar
      showErrorDialog();
    }
  }

  void showErrorDialog() {
    // Show dialog box
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          title: const NormalText("Error"),
          content: const NormalText("Mail app not found"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const NormalText(
                "Ok",
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kDrawerColor1,
      elevation: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: SizeConfig.screenHeight,
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HeightWidget(kDefaultFontSize + 4),
                    Image.asset(
                      "assets/images/test.png",
                      height: 60.0,
                      width: 60.0,
                    ),
                    const HeightWidget(8.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FlutterRemix.pen_nib_fill,
                          color: kWhiteColor,
                          size: 8.0,
                        ),
                        WidthWidget(4.0),
                        NormalText(
                          "Nepal Driving License Exam",
                          color: kWhiteColor,
                          fontSize: kDefaultFontSize - 8,
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const HeightWidget(kDefaultFontSize * 5),
                    Consumer(
                      builder: (context, ref, child) {
                        final drawer = ref.watch(drawerControllerNotifier);
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: options.length,
                          itemBuilder: (context, index) {
                            final OptionItems item = options[index];
                            return OptionWidget(
                              activeIcon: item.activeIcon,
                              title: item.title,
                              icon: item.icon,
                              isSelected: drawer.selectedIndex == index,
                              index: index,
                              onTap: () async {
                                switch (item.type) {
                                  case AppDrawerType.home:
                                    ref.read(navBarProvider).indexChange(0);
                                    widget.drawerController.close!();
                                    break;
                                  case AppDrawerType.equalizer:
                                    break;
                                  case AppDrawerType.sleepTimer:
                                    break;
                                  case AppDrawerType.settings:
                                    context.router.push(
                                        SettingsScreenRoute(showAppbar: true));
                                    break;
                                  case AppDrawerType.share:
                                    //  Handle this case.
                                    break;
                                  case AppDrawerType.rateUs:
                                    _launchUrl(
                                        "https://play.google.com/store/apps/details?id=com.visionxstudio.likhitexam");
                                    break;
                                  case AppDrawerType.feedback:
                                    final Uri params = Uri(
                                      scheme: 'mailto',
                                      path: 'likhittayari@gmail.com',
                                      query:
                                          'subject=App Feedback&body= Likhit Tayari Feedback', //add subject and body here
                                    );
                                    var url = params.toString();
                                    _launchUrl(url);

                                    break;
                                  case AppDrawerType.privacyPolicy:
                                    context.router
                                        .push(const PrivacyScreenRoute());
                                    break;
                                  case AppDrawerType.about:
                                    context.router
                                        .push(const AboutUsScreenRoute());
                                    break;
                                  case AppDrawerType.exit:
                                    //  Handle this case.
                                    break;
                                  case AppDrawerType.notification:
                                    //  Handle this case
                                    break;
                                }

                                // if (index == 1) {
                                //   _launchUrl(
                                //       "https://vnshortener.com/pages/nepal-driving-license-exam");
                                // }
                                // if (index == 3) {
                                //   context.router
                                //       .push(const AboutUsScreenRoute());
                                // }
                                // if (index == 4) {
                                //   _launchUrl(
                                //       "https://play.google.com/store/apps/details?id=com.visionxstudio.likhitexam");
                                // }
                                drawer.changeSelectedIndex(index);
                              },
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.activeIcon,
    required this.index,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData activeIcon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0, right: 16.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        height: 50.0,
        decoration: BoxDecoration(
          color: isSelected ? kWhiteColor.withOpacity(0.2) : null,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: kWhiteColor,
              size: 24.0,
            ),
            const WidthWidget(16.0),
            NormalText(
              title.tr(context),
              color: kWhiteColor,
              fontSize: kDefaultFontSize,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
            index == 1 ? const WidthWidget(2.0) : const SizedBox(),
            index == 1
                ? Consumer(builder: (context, ref, child) {
                    return Switch(
                        value: ref
                            .watch(drawerControllerNotifier)
                            .showNotification,
                        onChanged: (val) {
                          // ask for notification permission
                          ref
                              .read(drawerControllerNotifier)
                              .changeNotification(val);
                        });
                  })
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
