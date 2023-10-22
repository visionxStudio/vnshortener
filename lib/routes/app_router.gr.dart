// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../features/about_screen/about_screen.dart' as _i8;
import '../features/all_questions_screen/all_question_screen.dart' as _i9;
import '../features/exam_result/exam_result_screen.dart' as _i5;
import '../features/exam_screen/exam_screen.dart' as _i4;
import '../features/exam_selection/exam_selection_screen.dart' as _i3;
import '../features/eye_test/eye_test_screen.dart' as _i10;
import '../features/navbar/navbar.dart' as _i2;
import '../features/privacy_screen/privacy_screen.dart' as _i11;
import '../features/road_sign_screen/road_sign_screen.dart' as _i7;
import '../features/settings_screen/settings_screen.dart' as _i12;
import '../features/webview/webview_screen.dart' as _i6;
import '../features/welcome_screen/welcome_screen.dart' as _i1;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    WelcomeScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.WelcomeScreen());
    },
    NavBarRoute.name: (routeData) {
      final args = routeData.argsAs<NavBarRouteArgs>(
          orElse: () => const NavBarRouteArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.NavBar(key: args.key, activeNavPage: args.activeNavPage));
    },
    ExamSelectionScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ExamSelectionScreenRouteArgs>(
          orElse: () => const ExamSelectionScreenRouteArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.ExamSelectionScreen(
              key: args.key,
              isFromNavbar: args.isFromNavbar,
              isFromPracticeExam: args.isFromPracticeExam,
              isRoadSign: args.isRoadSign,
              studyQuestions: args.studyQuestions));
    },
    ExamScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ExamScreenRouteArgs>(
          orElse: () => const ExamScreenRouteArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ExamScreen(
              key: args.key, isFromPractice: args.isFromPractice));
    },
    ExamResultScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ExamResultScreenRouteArgs>(
          orElse: () => const ExamResultScreenRouteArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i5.ExamResultScreen(key: args.key, showResult: args.showResult));
    },
    RoadSignScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RoadSignScreen());
    },
    AboutUsScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.AboutUsScreen());
    },
    AllQuestionScreenRoute.name: (routeData) {
      final args = routeData.argsAs<AllQuestionScreenRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.AllQuestionScreen(key: args.key, isBike: args.isBike));
    },
    EyeTestScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.EyeTestScreen());
    },
    PrivacyScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.PrivacyScreen());
    },
    SettingsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsScreenRouteArgs>(
          orElse: () => const SettingsScreenRouteArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i12.SettingsScreen(key: args.key, showAppbar: args.showAppbar));
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(WelcomeScreenRoute.name, path: '/'),
        _i13.RouteConfig(NavBarRoute.name, path: '/nav-bar'),
        _i13.RouteConfig(ExamSelectionScreenRoute.name,
            path: '/exam-selection-screen'),
        _i13.RouteConfig(ExamScreenRoute.name, path: '/exam-screen'),
        _i13.RouteConfig(ExamResultScreenRoute.name,
            path: '/exam-result-screen'),
        _i13.RouteConfig(WebviewPageRoute.name, path: '/webview-page'),
        _i13.RouteConfig(RoadSignScreenRoute.name, path: '/road-sign-screen'),
        _i13.RouteConfig(AboutUsScreenRoute.name, path: '/about-us-screen'),
        _i13.RouteConfig(AllQuestionScreenRoute.name,
            path: '/all-question-screen'),
        _i13.RouteConfig(EyeTestScreenRoute.name, path: '/eye-test-screen'),
        _i13.RouteConfig(PrivacyScreenRoute.name, path: '/privacy-screen'),
        _i13.RouteConfig(SettingsScreenRoute.name, path: '/settings-screen')
      ];
}

/// generated route for
/// [_i1.WelcomeScreen]
class WelcomeScreenRoute extends _i13.PageRouteInfo<void> {
  const WelcomeScreenRoute() : super(WelcomeScreenRoute.name, path: '/');

  static const String name = 'WelcomeScreenRoute';
}

/// generated route for
/// [_i2.NavBar]
class NavBarRoute extends _i13.PageRouteInfo<NavBarRouteArgs> {
  NavBarRoute(
      {_i14.Key? key, _i2.NavBarPage activeNavPage = _i2.NavBarPage.settings})
      : super(NavBarRoute.name,
            path: '/nav-bar',
            args: NavBarRouteArgs(key: key, activeNavPage: activeNavPage));

  static const String name = 'NavBarRoute';
}

class NavBarRouteArgs {
  const NavBarRouteArgs(
      {this.key, this.activeNavPage = _i2.NavBarPage.settings});

  final _i14.Key? key;

  final _i2.NavBarPage activeNavPage;

  @override
  String toString() {
    return 'NavBarRouteArgs{key: $key, activeNavPage: $activeNavPage}';
  }
}

/// generated route for
/// [_i3.ExamSelectionScreen]
class ExamSelectionScreenRoute
    extends _i13.PageRouteInfo<ExamSelectionScreenRouteArgs> {
  ExamSelectionScreenRoute(
      {_i14.Key? key,
      bool isFromNavbar = false,
      bool isFromPracticeExam = false,
      bool isRoadSign = false,
      bool studyQuestions = false})
      : super(ExamSelectionScreenRoute.name,
            path: '/exam-selection-screen',
            args: ExamSelectionScreenRouteArgs(
                key: key,
                isFromNavbar: isFromNavbar,
                isFromPracticeExam: isFromPracticeExam,
                isRoadSign: isRoadSign,
                studyQuestions: studyQuestions));

  static const String name = 'ExamSelectionScreenRoute';
}

class ExamSelectionScreenRouteArgs {
  const ExamSelectionScreenRouteArgs(
      {this.key,
      this.isFromNavbar = false,
      this.isFromPracticeExam = false,
      this.isRoadSign = false,
      this.studyQuestions = false});

  final _i14.Key? key;

  final bool isFromNavbar;

  final bool isFromPracticeExam;

  final bool isRoadSign;

  final bool studyQuestions;

  @override
  String toString() {
    return 'ExamSelectionScreenRouteArgs{key: $key, isFromNavbar: $isFromNavbar, isFromPracticeExam: $isFromPracticeExam, isRoadSign: $isRoadSign, studyQuestions: $studyQuestions}';
  }
}

/// generated route for
/// [_i4.ExamScreen]
class ExamScreenRoute extends _i13.PageRouteInfo<ExamScreenRouteArgs> {
  ExamScreenRoute({_i14.Key? key, bool isFromPractice = false})
      : super(ExamScreenRoute.name,
            path: '/exam-screen',
            args:
                ExamScreenRouteArgs(key: key, isFromPractice: isFromPractice));

  static const String name = 'ExamScreenRoute';
}

class ExamScreenRouteArgs {
  const ExamScreenRouteArgs({this.key, this.isFromPractice = false});

  final _i14.Key? key;

  final bool isFromPractice;

  @override
  String toString() {
    return 'ExamScreenRouteArgs{key: $key, isFromPractice: $isFromPractice}';
  }
}

/// generated route for
/// [_i5.ExamResultScreen]
class ExamResultScreenRoute
    extends _i13.PageRouteInfo<ExamResultScreenRouteArgs> {
  ExamResultScreenRoute({_i14.Key? key, bool showResult = true})
      : super(ExamResultScreenRoute.name,
            path: '/exam-result-screen',
            args: ExamResultScreenRouteArgs(key: key, showResult: showResult));

  static const String name = 'ExamResultScreenRoute';
}

class ExamResultScreenRouteArgs {
  const ExamResultScreenRouteArgs({this.key, this.showResult = true});

  final _i14.Key? key;

  final bool showResult;

  @override
  String toString() {
    return 'ExamResultScreenRouteArgs{key: $key, showResult: $showResult}';
  }
}

/// generated route for
/// [_i6.WebviewPage]
class WebviewPageRoute extends _i13.PageRouteInfo<WebviewPageRouteArgs> {
  WebviewPageRoute({_i14.Key? key, required String url, required String title})
      : super(WebviewPageRoute.name,
            path: '/webview-page',
            args: WebviewPageRouteArgs(key: key, url: url, title: title));

  static const String name = 'WebviewPageRoute';
}

class WebviewPageRouteArgs {
  const WebviewPageRouteArgs(
      {this.key, required this.url, required this.title});

  final _i14.Key? key;

  final String url;

  final String title;

  @override
  String toString() {
    return 'WebviewPageRouteArgs{key: $key, url: $url, title: $title}';
  }
}

/// generated route for
/// [_i7.RoadSignScreen]
class RoadSignScreenRoute extends _i13.PageRouteInfo<void> {
  const RoadSignScreenRoute()
      : super(RoadSignScreenRoute.name, path: '/road-sign-screen');

  static const String name = 'RoadSignScreenRoute';
}

/// generated route for
/// [_i8.AboutUsScreen]
class AboutUsScreenRoute extends _i13.PageRouteInfo<void> {
  const AboutUsScreenRoute()
      : super(AboutUsScreenRoute.name, path: '/about-us-screen');

  static const String name = 'AboutUsScreenRoute';
}

/// generated route for
/// [_i9.AllQuestionScreen]
class AllQuestionScreenRoute
    extends _i13.PageRouteInfo<AllQuestionScreenRouteArgs> {
  AllQuestionScreenRoute({_i14.Key? key, required bool isBike})
      : super(AllQuestionScreenRoute.name,
            path: '/all-question-screen',
            args: AllQuestionScreenRouteArgs(key: key, isBike: isBike));

  static const String name = 'AllQuestionScreenRoute';
}

class AllQuestionScreenRouteArgs {
  const AllQuestionScreenRouteArgs({this.key, required this.isBike});

  final _i14.Key? key;

  final bool isBike;

  @override
  String toString() {
    return 'AllQuestionScreenRouteArgs{key: $key, isBike: $isBike}';
  }
}

/// generated route for
/// [_i10.EyeTestScreen]
class EyeTestScreenRoute extends _i13.PageRouteInfo<void> {
  const EyeTestScreenRoute()
      : super(EyeTestScreenRoute.name, path: '/eye-test-screen');

  static const String name = 'EyeTestScreenRoute';
}

/// generated route for
/// [_i11.PrivacyScreen]
class PrivacyScreenRoute extends _i13.PageRouteInfo<void> {
  const PrivacyScreenRoute()
      : super(PrivacyScreenRoute.name, path: '/privacy-screen');

  static const String name = 'PrivacyScreenRoute';
}

/// generated route for
/// [_i12.SettingsScreen]
class SettingsScreenRoute extends _i13.PageRouteInfo<SettingsScreenRouteArgs> {
  SettingsScreenRoute({_i14.Key? key, bool showAppbar = false})
      : super(SettingsScreenRoute.name,
            path: '/settings-screen',
            args: SettingsScreenRouteArgs(key: key, showAppbar: showAppbar));

  static const String name = 'SettingsScreenRoute';
}

class SettingsScreenRouteArgs {
  const SettingsScreenRouteArgs({this.key, this.showAppbar = false});

  final _i14.Key? key;

  final bool showAppbar;

  @override
  String toString() {
    return 'SettingsScreenRouteArgs{key: $key, showAppbar: $showAppbar}';
  }
}
