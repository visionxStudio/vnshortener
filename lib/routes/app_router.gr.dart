// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../features/homepage/homepage.dart' as _i3;
import '../features/root/root.dart' as _i2;
import '../features/splash/vnshortner_splash.dart' as _i1;
import '../features/webview_page/webviewpage_screen.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    VnShortnerSplashScreenRoute.name: (routeData) {
      final args = routeData.argsAs<VnShortnerSplashScreenRouteArgs>(
          orElse: () => const VnShortnerSplashScreenRouteArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.VnShortnerSplashScreen(
          key: args.key,
          isSwitched: args.isSwitched,
        ),
      );
    },
    RootRoute.name: (routeData) {
      final args =
          routeData.argsAs<RootRouteArgs>(orElse: () => const RootRouteArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.Root(
          key: args.key,
          isSwitching: args.isSwitching,
        ),
      );
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.WebViewPage(
          key: args.key,
          url: args.url,
        ),
      );
    },
    HomepageRoute.name: (routeData) {
      final args = routeData.argsAs<HomepageRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.Homepage(
          key: args.key,
          url: args.url,
        ),
      );
    },
    WebViewNavigatePageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewNavigatePageRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.WebViewNavigatePage(
          key: args.key,
          appBarColor: args.appBarColor,
          url: args.url,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          VnShortnerSplashScreenRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          RootRoute.name,
          path: '/Root',
        ),
        _i5.RouteConfig(
          WebViewPageRoute.name,
          path: '/web-view-page',
        ),
        _i5.RouteConfig(
          HomepageRoute.name,
          path: '/Homepage',
        ),
        _i5.RouteConfig(
          WebViewNavigatePageRoute.name,
          path: '/web-view-navigate-page',
        ),
      ];
}

/// generated route for
/// [_i1.VnShortnerSplashScreen]
class VnShortnerSplashScreenRoute
    extends _i5.PageRouteInfo<VnShortnerSplashScreenRouteArgs> {
  VnShortnerSplashScreenRoute({
    _i6.Key? key,
    bool isSwitched = false,
  }) : super(
          VnShortnerSplashScreenRoute.name,
          path: '/',
          args: VnShortnerSplashScreenRouteArgs(
            key: key,
            isSwitched: isSwitched,
          ),
        );

  static const String name = 'VnShortnerSplashScreenRoute';
}

class VnShortnerSplashScreenRouteArgs {
  const VnShortnerSplashScreenRouteArgs({
    this.key,
    this.isSwitched = false,
  });

  final _i6.Key? key;

  final bool isSwitched;

  @override
  String toString() {
    return 'VnShortnerSplashScreenRouteArgs{key: $key, isSwitched: $isSwitched}';
  }
}

/// generated route for
/// [_i2.Root]
class RootRoute extends _i5.PageRouteInfo<RootRouteArgs> {
  RootRoute({
    _i6.Key? key,
    bool isSwitching = false,
  }) : super(
          RootRoute.name,
          path: '/Root',
          args: RootRouteArgs(
            key: key,
            isSwitching: isSwitching,
          ),
        );

  static const String name = 'RootRoute';
}

class RootRouteArgs {
  const RootRouteArgs({
    this.key,
    this.isSwitching = false,
  });

  final _i6.Key? key;

  final bool isSwitching;

  @override
  String toString() {
    return 'RootRouteArgs{key: $key, isSwitching: $isSwitching}';
  }
}

/// generated route for
/// [_i3.WebViewPage]
class WebViewPageRoute extends _i5.PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({
    _i6.Key? key,
    required String url,
  }) : super(
          WebViewPageRoute.name,
          path: '/web-view-page',
          args: WebViewPageRouteArgs(
            key: key,
            url: url,
          ),
        );

  static const String name = 'WebViewPageRoute';
}

class WebViewPageRouteArgs {
  const WebViewPageRouteArgs({
    this.key,
    required this.url,
  });

  final _i6.Key? key;

  final String url;

  @override
  String toString() {
    return 'WebViewPageRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i3.Homepage]
class HomepageRoute extends _i5.PageRouteInfo<HomepageRouteArgs> {
  HomepageRoute({
    _i6.Key? key,
    required String url,
  }) : super(
          HomepageRoute.name,
          path: '/Homepage',
          args: HomepageRouteArgs(
            key: key,
            url: url,
          ),
        );

  static const String name = 'HomepageRoute';
}

class HomepageRouteArgs {
  const HomepageRouteArgs({
    this.key,
    required this.url,
  });

  final _i6.Key? key;

  final String url;

  @override
  String toString() {
    return 'HomepageRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i4.WebViewNavigatePage]
class WebViewNavigatePageRoute
    extends _i5.PageRouteInfo<WebViewNavigatePageRouteArgs> {
  WebViewNavigatePageRoute({
    _i6.Key? key,
    required _i6.Color appBarColor,
    required String url,
  }) : super(
          WebViewNavigatePageRoute.name,
          path: '/web-view-navigate-page',
          args: WebViewNavigatePageRouteArgs(
            key: key,
            appBarColor: appBarColor,
            url: url,
          ),
        );

  static const String name = 'WebViewNavigatePageRoute';
}

class WebViewNavigatePageRouteArgs {
  const WebViewNavigatePageRouteArgs({
    this.key,
    required this.appBarColor,
    required this.url,
  });

  final _i6.Key? key;

  final _i6.Color appBarColor;

  final String url;

  @override
  String toString() {
    return 'WebViewNavigatePageRouteArgs{key: $key, appBarColor: $appBarColor, url: $url}';
  }
}
