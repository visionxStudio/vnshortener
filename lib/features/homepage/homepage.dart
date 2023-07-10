import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../routes/app_router.gr.dart';
import '../../widgets/custom_progress_indicator_overlay.dart';
import '../ads_services/app_open_ads.dart';
import 'bloc/navbar_provider.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  WebViewPageState createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  AppOpenAdManager appOpenAdManager = AppOpenAdManager();
  final webViewKey1 = GlobalKey<HomepageState>();
  final webViewKey2 = GlobalKey<HomepageState>();
  @override
  void initState() {
    super.initState();
    showAppOpenAds();
  }

  Future<void> showAppOpenAds() async {
    appOpenAdManager.loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: Container(
      //   height: 40.0,
      //   width: 40.0,
      //   margin: const EdgeInsets.only(bottom: 60),
      //   child: FloatingActionButton(
      //     child: const Icon(Icons.refresh),
      //     onPressed: () {
      //       webViewKey.currentState?.reloadWebView();
      //       Fluttertoast.showToast(msg: "Reloading...");
      //     },
      //   ),
      // ),
      body: Homepage(
        key: widget.url.contains("nestshortener") ? webViewKey1 : webViewKey2,
        url: widget.url,
      ),
    );
  }
}

class Homepage extends ConsumerStatefulWidget {
  const Homepage({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends ConsumerState<Homepage> {
  Color appBarColor = Colors.black;
  bool isLoadingUrl = true;
  WebViewController? _webViewController;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _webViewController?.canGoBack() == true) {
          _webViewController?.goBack();
          return false;
        } else {
          // ignore: use_build_context_synchronously
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Do you want to exit the App'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Yes'),
                ),
              ],
            ),
          );
        }
        return true;
      },
      child: CustomProgressIndicatorOverlay(
        isLoading: false,
        child: Scaffold(
          // bottomNavigationBar: ,
          bottomNavigationBar: CustomBottomNavigationBar(
            appBarColor: appBarColor,
            ref: ref,
          ),
          // appBar: AppBar(
          //   // toolbarHeight: 0.0,
          //   // backgroundColor: const Color(0xff1e1e29),
          // backgroundColor: widget.url.contains("nestshortener")
          //     ? const Color(0xFF282c34)
          //     : Colors.white,
          //   leading: IconButton(
          //     onPressed: () {
          //       context.router.push(RootRoute(isSwitching: true));
          //     },
          //     icon: Icon(
          //       Icons.grid_view_rounded,
          //       color: widget.url.contains("nestshortener")
          //           ? Colors.white
          //           : Colors.black,
          //     ),
          //   ),
          //   elevation: 0.0,
          // ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: widget.url.contains("nestshortener")
                ? const Color(0xFF282c34)
                : Colors.white,
            mini: true,
            onPressed: () {
              context.router.push(RootRoute(isSwitching: true));
            },
            child: Icon(
              Icons.grid_view_rounded,
              color: widget.url.contains("nestshortener")
                  ? Colors.white
                  : Colors.blue,
            ),
          ),
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                const snackBar = SnackBar(
                  content: Text('Reloading...'),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                await _webViewController?.reload();
              },
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: WebView(
                    onWebViewCreated: (controller) {
                      _webViewController = controller;
                    },
                    userAgent: Platform.isIOS
                        ? 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_1_2 like Mac OS X) AppleWebKit/605.1.15'
                            ' (KHTML, like Gecko) Version/13.0.1 Mobile/15E148 Safari/604.1'
                        : 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) '
                            'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36',
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: "${widget.url}/auth/signin",
                    onProgress: (int progress) {},
                    gestureNavigationEnabled: true,
                    backgroundColor: const Color(0xff1e1e29),
                    onPageStarted: (String url) {
                      if (url == "${widget.url}/") {
                        setState(() {
                          appBarColor = Colors.white;
                        });
                        context.router.replace(
                          WebViewNavigatePageRoute(
                            appBarColor: const Color(0xFF1c1e2f),
                            url: "${widget.url}/member/dashboard",
                          ),
                        );
                      }
                      if (url == "${widget.url}/auth/signin") {
                        setState(() {
                          appBarColor = Colors.white;
                        });
                      }
                      if (url == widget.url) {
                        context.router.replace(
                          WebViewNavigatePageRoute(
                            appBarColor: const Color(0xFF1c1e2f),
                            url: "${widget.url}/member/dashboard",
                          ),
                        );
                      }
                    },
                    allowsInlineMediaPlayback: true,
                    navigationDelegate: (NavigationRequest request) {
                      // if (request.url.contains(
                      //     "https://accounts.google.com/o/oauth2/auth?client_id=")) {
                      //   return NavigationDecision.prevent;
                      // }

                      if (request.url == "${widget.url}/member/dashboard") {
                        context.router.replace(
                          WebViewNavigatePageRoute(
                            appBarColor: const Color(0xFF1c1e2f),
                            url: "${widget.url}/member/dashboard",
                          ),
                        );
                        setState(() {
                          appBarColor = const Color(0xff1e1e29);
                        });
                        return NavigationDecision.navigate;
                      }
                      if (request.url == widget.url) {
                        setState(() {
                          appBarColor = const Color(0xff1e1e29);
                        });
                        return NavigationDecision.navigate;
                      }
                      if (request.url == "https://codewithcrush.com/") {
                        setState(() {
                          appBarColor = const Color(0xff742088);
                        });
                        return NavigationDecision.navigate;
                      }

                      return NavigationDecision.navigate;
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void reloadWebView() {
    _webViewController?.reload();
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.appBarColor,
    required this.ref,
  }) : super(key: key);

  final Color appBarColor;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              // color: Theme.of(context).bottomAppBarColor,
              // color: const Color(0xFF1c1e2f),
              color: appBarColor,
              // boxShadow: [
              //   BoxShadow(
              //     color: appBarColor != Colors.white
              //         ? appBarColor.withOpacity(0.8)
              //         : Colors.black.withOpacity(0.1),
              //     blurRadius: 20.0,
              //     spreadRadius: 0,
              //   )
              // ],
            ),
            child: SalomonBottomBar(
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
              currentIndex: ref.watch(navbarNotifierProvider).currentIndex,
              onTap: (value) {
                ref.read(navbarNotifierProvider).changeIndex(value);
              },
              items: [
                SalomonBottomBarItem(
                  activeIcon: const Icon(FlutterRemix.home_7_fill),
                  icon: const Icon(FlutterRemix.home_8_line),
                  title: const Text("Dashboard"),
                  selectedColor: appBarColor != Colors.white
                      ? const Color(0xFF29c0b1)
                      : Theme.of(context).primaryColor,
                  unselectedColor: appBarColor != Colors.white
                      ? Colors.white.withOpacity(0.8)
                      : null,
                ),
                SalomonBottomBarItem(
                  activeIcon: const Icon(FlutterRemix.link),
                  icon: const Icon(FlutterRemix.link),
                  title: const Text("Manage Links"),
                  selectedColor: appBarColor != Colors.white
                      ? const Color(0xFF29c0b1)
                      : Theme.of(context).primaryColor,
                  unselectedColor: appBarColor != Colors.white
                      ? Colors.white.withOpacity(0.8)
                      : null,
                ),
                SalomonBottomBarItem(
                  activeIcon: const Icon(FlutterRemix.money_dollar_box_fill),
                  icon: const Icon(FlutterRemix.money_dollar_box_line),
                  title: const Text("Payouts"),
                  selectedColor: appBarColor != Colors.white
                      ? const Color(0xFF29c0b1)
                      : Theme.of(context).primaryColor,
                  unselectedColor: appBarColor != Colors.white
                      ? Colors.white.withOpacity(0.8)
                      : null,
                ),
                SalomonBottomBarItem(
                  activeIcon: const Icon(FlutterRemix.settings_2_fill),
                  icon: const Icon(FlutterRemix.settings_2_line),
                  title: const Text("Settings"),
                  selectedColor: appBarColor != Colors.white
                      ? const Color(0xFF29c0b1)
                      : Theme.of(context).primaryColor,
                  unselectedColor: appBarColor != Colors.white
                      ? Colors.white.withOpacity(0.8)
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
