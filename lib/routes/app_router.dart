import 'package:auto_route/auto_route.dart';
import 'package:likhitexam/features/exam_screen/exam_screen.dart';
import 'package:likhitexam/features/exam_selection/exam_selection_screen.dart';
import 'package:likhitexam/features/eye_test/eye_test_screen.dart';
import 'package:likhitexam/features/navbar/navbar.dart';
import 'package:likhitexam/features/privacy_screen/privacy_screen.dart';
import 'package:likhitexam/features/settings_screen/settings_screen.dart';
import 'package:likhitexam/features/welcome_screen/welcome_screen.dart';

import '../features/about_screen/about_screen.dart';
import '../features/all_questions_screen/all_question_screen.dart';
import '../features/exam_result/exam_result_screen.dart';
import '../features/road_sign_screen/road_sign_screen.dart';

//  flutter packages pub run build_runner watch --delete-conflicting-outputs

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // AutoRoute(page: AppSplashScreen, initial: true),
    AutoRoute(page: WelcomeScreen, initial: true),
    AutoRoute(page: NavBar),
    AutoRoute(page: ExamSelectionScreen),
    AutoRoute(page: ExamScreen),
    AutoRoute(page: ExamResultScreen),
    AutoRoute(page: RoadSignScreen),
    AutoRoute(page: AboutUsScreen),
    AutoRoute(page: AllQuestionScreen),
    AutoRoute(page: EyeTestScreen),
    AutoRoute(page: PrivacyScreen),
    AutoRoute(page: SettingsScreen),
  ],
)
class $AppRouter {}
