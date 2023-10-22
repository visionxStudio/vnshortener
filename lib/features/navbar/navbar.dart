import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:likhitexam/common/service/extension/text_extension.dart';
import 'package:likhitexam/common/widgets/text/custom_normal_text_widget.dart';
import 'package:likhitexam/features/drawer/drawer.dart';

import 'package:likhitexam/features/home_screen/home_screen.dart';
import 'package:likhitexam/features/navbar/navbar_notifier.dart';
import 'package:likhitexam/features/settings_screen/settings_screen.dart';

import '../../common/common_service_provider.dart';
import '../../common/constants/constants.dart';
import '../../common/service/services/notification_api_service.dart';
import '../../common/utils/app_size_utils.dart';
import '../exam_selection/exam_selection_screen.dart';

enum NavBarPage {
  home,

  exam,

  settings,
}

extension NavBarPageX on NavBarPage {
  IconData getAsset() {
    switch (this) {
      case NavBarPage.home:
        return Ionicons.home_outline;
      case NavBarPage.exam:
        return Ionicons.trophy_outline;
      case NavBarPage.settings:
        return Ionicons.settings_outline;
    }
  }
}

List<IconData> activeIcon = [
  FlutterRemix.home_fill,
  FlutterRemix.layout_masonry_fill,
  FlutterRemix.settings_4_fill,
];

class NavBar extends ConsumerStatefulWidget {
  final NavBarPage activeNavPage;
  const NavBar({
    Key? key,
    this.activeNavPage = NavBarPage.settings,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends ConsumerState<NavBar> {
  final ZoomDrawerController _controller = ZoomDrawerController();
  bool shouldQuit = false;
  get kWhiteColor => null;
  @override
  void initState() {
    NotificationsApi.cancelNotifications();
    Future.delayed(const Duration(milliseconds: 10), () {
      NotificationsApi.showScheduledNotifications(
        scheduledDate: DateTime.now().add(const Duration(days: 3)),
        title:
            "Hello ${ref.watch(commonServiceProvider).userName}, we are missing you 🤗",
        body: "Read or take a practice exam for your license exam.",
        payload: "abx",
        id: 2,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer(
      builder: (ctx, ref, child) {
        var edgeInsets = const EdgeInsets.only(bottom: 0, top: 0);

        return WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: ZoomDrawer(
            controller: _controller,
            menuBackgroundColor: kDrawerColor1,
            slideWidth: SizeConfig.screenWidth * 0.85,
            angle: -5.0,
            showShadow: true,
            androidCloseOnBackTap: true,
            mainScreenTapClose: true,
            openCurve: Curves.fastOutSlowIn,
            closeCurve: Curves.decelerate,
            menuScreenTapClose: false,
            menuScreen: AppDrawer(drawerController: _controller),
            mainScreen: Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                title: ref.watch(navBarProvider).index == 1
                    ? const NormalText(
                        "select_exam.type",
                        fontWeight: FontWeight.bold,
                      )
                    : null,
                leading: GestureDetector(
                  onTap: () {
                    _controller.toggle!();
                  },
                  child: const Icon(
                    Icons.menu,
                    color: kBlackColor,
                  ),
                ),
                backgroundColor: ref.watch(navBarProvider).index == 2
                    ? kgreyColorLight
                    : Colors.white,
              ),
              extendBody: true,
              body: Builder(
                builder: (context) {
                  switch (ref.watch(navBarProvider).activeNavPage) {
                    case NavBarPage.home:
                      return const HomeScreen();
                    case NavBarPage.exam:
                      return const ExamSelectionScreen(
                        isFromNavbar: true,
                      );

                    case NavBarPage.settings:
                      return const SettingsScreen();
                  }
                },
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, -8),
                      blurRadius: 16.0,
                      spreadRadius: 0.0,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                ),
                width: double.infinity,
                height: 90.0,
                padding: edgeInsets,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: NavBarPage.values
                      .map(
                        (e) => _NavBarButton(
                          index: e.index,
                          onTap: () {
                            ref.read(navBarProvider).indexChange(e.index);
                          },
                          active: ref.read(navBarProvider).index == e.index,
                          asset: e.getAsset(),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    Key? key,
    required this.index,
    required this.onTap,
    required this.active,
    required this.asset,
    // ignore: unused_element
    this.center = false,
  }) : super(key: key);

  final VoidCallback onTap;
  final int index;
  final bool active;
  final IconData asset;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: center ? 50.0 : 65.0,
          // width: center ? 50.0 : 69.0,
          child: Center(
            child: Column(
              children: [
                // line

                Icon(
                  asset,
                  color: active
                      ? const Color(0xff2475f5)
                      : kInactiveColor.withOpacity(0.6),
                  size: 28.0,
                ),
                SizedBox(
                  height: center ? 0.0 : 4.0,
                ),
                NormalText(
                  NavBarPage.values[index]
                      .toString()
                      .split(".")[1]
                      .capitalize(),
                  color: active
                      ? const Color(0xff2475f5)
                      : kInactiveColor.withOpacity(0.6),
                  fontSize: kDefaultFontSize - 4,
                  maxline: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
