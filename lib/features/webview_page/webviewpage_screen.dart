import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../routes/app_router.gr.dart';
import '../ads_services/banner_ad.dart';
import '../homepage/bloc/navbar_provider.dart';
import '../homepage/homepage.dart';

final webViewKey = GlobalKey<WebviewScreenState>();

class WebViewNavigatePage extends ConsumerStatefulWidget {
  const WebViewNavigatePage(
      {Key? key, required this.appBarColor, required this.url})
      : super(key: key);
  final Color appBarColor;
  final String url;

  @override
  WebViewNavigatePageState createState() => WebViewNavigatePageState();
}

class WebViewNavigatePageState extends ConsumerState<WebViewNavigatePage> {
  Widget getBodyPage({required int index}) {
    final String finalUrl = widget.url.contains("vnshortener")
        ? "https://vnshortener.com"
        : "https://nestshortener.com";
    return [
      WebviewScreen(
        key: webViewKey,
        appBarColor: widget.appBarColor,
        url: widget.url,
      ),
      WebviewScreen(
        key: UniqueKey(),
        appBarColor: widget.appBarColor,
        url: "$finalUrl/member/links",
      ),
      WebviewScreen(
        key: UniqueKey(),
        appBarColor: widget.appBarColor,
        url: "$finalUrl/member/withdraws",
      ),
      WebviewScreen(
        key: UniqueKey(),
        appBarColor: widget.appBarColor,
        url: "$finalUrl/member/users/profile",
      ),
    ][index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: Container(
      //   margin: const EdgeInsets.only(bottom: 60),
      //   height: 40.0,
      //   width: 40.0,
      //   child: FloatingActionButton(
      //     child: const Icon(Icons.refresh),
      //     onPressed: () {
      //       webViewKey.currentState?.reloadWebView();
      //       Fluttertoast.showToast(msg: "Reloading...");
      //     },
      //   ),
      // ),
      body: Consumer(
        builder: (context, ref, child) {
          return getBodyPage(
            index: ref.watch(navbarNotifierProvider).currentIndex,
          );
        },
      ),
    );
  }
}

class WebviewScreen extends ConsumerStatefulWidget {
  const WebviewScreen({Key? key, required this.appBarColor, required this.url})
      : super(key: key);

  final Color appBarColor;
  final String url;

  @override
  WebviewScreenState createState() => WebviewScreenState();
}

class WebviewScreenState extends ConsumerState<WebviewScreen>
    with AutomaticKeepAliveClientMixin {
  WebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
      child: Scaffold(
        backgroundColor: const Color(0xff1c1e2f),
        bottomNavigationBar: CustomBottomNavigationBar(
            appBarColor: const Color(0xff1e1e29), ref: ref),
        appBar: AppBar(
          toolbarHeight: 0.0,
          backgroundColor: widget.url.contains("nestshortener")
              ? const Color(0xFF282c34)
              : Colors.white,
          elevation: 0.0,
        ),
        // appBar: AppBar(
        //   // toolbarHeight: 0.0,
        //   // backgroundColor: const Color(0xff1e1e29),
        //   backgroundColor: widget.url.contains("nestshortener")
        //       ? const Color(0xFF282c34)
        //       : Colors.white,
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
        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Container(
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.245, right: 18),
          child: FloatingActionButton(
            backgroundColor: widget.url.contains("nestshortener")
                ? const Color(0xFF282c34)
                : const Color(0xff171474),
            mini: true,
            onPressed: () {
              context.router.push(RootRoute(isSwitching: true));
            },
            child: const Icon(
              Icons.grid_view_rounded,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),

        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
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
                        height: MediaQuery.of(context).size.height - 150,
                        child: WebView(
                          backgroundColor: const Color(0xff1c1e2f),
                          onWebViewCreated: (controller) {
                            _webViewController = controller;
                          },
                          initialUrl: widget.url,
                          javascriptMode: JavascriptMode.unrestricted,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BannerAdWidget(),
            )
          ],
        ),
      ),
    );
  }

  void reloadWebView() {
    _webViewController?.reload();
  }

  @override
  bool get wantKeepAlive => true;
}
