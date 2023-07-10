import 'package:auto_route/auto_route.dart';

import '../features/homepage/homepage.dart';
import '../features/root/root.dart';
import '../features/splash/vnshortner_splash.dart';
import '../features/webview_page/webviewpage_screen.dart';

//  flutter packages pub run build_runner watch --delete-conflicting-outputs

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: VnShortnerSplashScreen, initial: true),
    AutoRoute(page: Root),
    AutoRoute(page: WebViewPage),
    AutoRoute(page: Homepage),
    AutoRoute(page: WebViewNavigatePage),
  ],
)
class $AppRouter {}
