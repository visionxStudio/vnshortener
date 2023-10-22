import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:likhitexam/features/eye_test/models/eye_test_model.dart';

final eyeTestProviderNotifier =
    ChangeNotifierProvider.autoDispose<EyeTestNotifier>((ref) {
  return EyeTestNotifier();
});

class EyeTestNotifier extends ChangeNotifier {
  int currentQuestion = 0;
  PageController pageController = PageController(initialPage: 0);
  List<EyeTestModel> questions = eyeTestDataList;
  List<int> selectedAnswers = [];

  void nextQuestion() {
    currentQuestion++;
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }

  void previousQuestion() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    currentQuestion--;
    notifyListeners();
  }

  void resetQuestion() {
    pageController.jumpToPage(0);
    currentQuestion = 0;
    notifyListeners();
  }

  void selectAnswer(int answer, int index) {
    questions[index].userAnswer = answer;
    notifyListeners();
  }
}
