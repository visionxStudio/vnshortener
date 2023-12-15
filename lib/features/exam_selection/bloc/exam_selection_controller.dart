import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:likhitexam/features/exam_screen/model/question_answer_model/question_answer_model.dart';

import '../../../common/data/bike_image_questions.dart';
import '../../../common/data/car_questions_list.dart';
import '../../../common/data/bike_questions_list.dart';
import '../../../common/service/shared_pref_provider.dart';
import '../../exam_screen/model/road_sign_questions_model/road_sign_question_model.dart';

List<String> optionList = [
  'क',
  'ख',
  'ग',
  'घ',
];

final examNotifierProvider =
    ChangeNotifierProvider.autoDispose<ExamSelectionNotifier>(
        (ref) => ExamSelectionNotifier());

class ExamSelectionNotifier extends ChangeNotifier {
  int selectedIndex = -1;
  List<QuestionAnswerModel> randomQuestions = [];
  List<String> correctOptions = [];
  int pageViewIndex = 0;
  int correctAnswers = 0;
  int numberOfImageQuestions = 5;
  bool isLoading = false;
  int numberOfQuestions = 20;
  int previousIndex = 0;

  List<RoadSignQuestionModel> roadSignQuestionList = [];

  void initializeData({required bool hardReset}) {
    // randomQuestions = [];
    // correctOptions = [];
    // pageViewIndex = 0;
    // correctAnswers = 0;
    // numberOfImageQuestions = 5;
    // isLoading = false;
    // roadSignQuestionList = [];
    if (hardReset) {
      selectedIndex = -1;
    }

    randomQuestions = [];
    correctOptions = [];
    pageViewIndex = 0;
    correctAnswers = 0;
    numberOfImageQuestions = 5;
    isLoading = false;
    numberOfQuestions = 20;
    previousIndex = 0;
    roadSignQuestionList = [];
  }

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void pageViewIndexChanged(int index) {
    pageViewIndex = index;
    notifyListeners();
  }

  int getCorrectAnswerIndexFromOption({required String correctAnswer}) {
    return optionList.indexOf(correctAnswer);
  }

  void generateRoadSignQuestions() {
    isLoading = true;
    notifyListeners();
    roadSignQuestionList.clear();
    for (var element in bikeImageQuestions) {
      final RoadSignQuestionModel question = RoadSignQuestionModel(
        imageUrl: element['image'],
        answer: element['options'][getCorrectAnswerIndexFromOption(
          correctAnswer: element['correct_answer'],
        )],
      );
      roadSignQuestionList.add(question);
    }
    isLoading = false;
    notifyListeners();
  }

  void increaseNumberofQuestions() {
    numberOfQuestions += 20;
  }

  void changePreviousIndex(int index) {
    previousIndex = index;
    notifyListeners();
  }

  // void generateQuestions({required bool isBike, bool isLoadingMore = false}) {
  //   isLoading = true;
  //   notifyListeners();
  //   if (isLoadingMore) {
  //     changePreviousIndex(numberOfQuestions);
  //     increaseNumberofQuestions();
  //   } else {
  //     randomQuestions.clear();
  //   }

  //   final List<Map<String, dynamic>> questionList =
  //       isBike ? bikeQuestionList : carQuestionsList;

  //   if (!isLoadingMore) {
  //     for (Map<String, dynamic> element in bikeImageQuestions) {
  //       questionList.add(element);
  //     }
  //   }

  //   for (int i = previousIndex; i < numberOfQuestions; i++) {
  //     final Map<String, dynamic> element = questionList[i];
  //     final QuestionAnswerModel question = QuestionAnswerModel(
  //       question: element['question'],
  //       options: element["options"],
  //       answer: element['correct_answer'],
  //       image: element['image'],
  //     );

  //     randomQuestions.add(question);
  //   }
  //   isLoading = false;
  //   notifyListeners();
  // }

  void generateRandomQuestions({
    required int numberOfQuestions,
    required bool isBike,
    isFromPracticeExam = false,
    isRoadSign = false,
    studyQuestions = false,
  }) {
    isLoading = true;
    notifyListeners();
    randomQuestions.clear();
    correctOptions.clear();
    final random = Random();
    if (isFromPracticeExam) {
      // change the number of questions
      numberOfQuestions = SharedPrefProvider.instance().getInt("practiceExam")!;
      numberOfImageQuestions =
          SharedPrefProvider.instance().getInt("practiceExamImage")!;
    }

    final List<Map<String, dynamic>> questionList =
        isBike ? bikeQuestionList : carQuestionsList;

    if (studyQuestions) {
      numberOfQuestions = questionList.length;
      numberOfImageQuestions = bikeImageQuestions.length;
    }

    // adding random questions without image
    for (int i = 0; i < numberOfQuestions; i++) {
      final int randomIndex =
          studyQuestions ? i : random.nextInt(isBike ? 405 : 406);

      final Map<String, dynamic> element = questionList[randomIndex];
      debugPrint(randomIndex.toString());
      final QuestionAnswerModel question = QuestionAnswerModel(
        question: element['question'],
        options: element["options"],
        answer: element['correct_answer'],
        image: element['image'],
      );
      correctOptions.add(element['correct_answer']);
      randomQuestions.add(question);
    }
    // adding random questions with image
    for (int i = 0; i < numberOfImageQuestions; i++) {
      final int randomIndex =
          studyQuestions ? i : random.nextInt(bikeImageQuestions.length);
      final Map<String, dynamic> element = bikeImageQuestions[randomIndex];
      final QuestionAnswerModel question = QuestionAnswerModel(
        question: element['question'],
        options: element["options"],
        answer: element['correct_answer'],
        image: element['image'],
      );
      correctOptions.add(element['correct_answer']);
      randomQuestions.add(question);
    }
    isLoading = false;
    notifyListeners();
  }

  bool checkAnswer(int index, int answerIndex) {
    String correctAnswer = correctOptions[index];
    if (correctAnswer == optionList[answerIndex]) {
      correctAnswers += 1;
      return true;
    } else {
      return false;
    }
  }

  void addUserAnswer(int index, String selectedAnswer) {
    final QuestionAnswerModel question = randomQuestions[index];
    randomQuestions[index] = question.copyWith(
        userAnswer: question.options.indexOf(selectedAnswer),
        isCorrect:
            checkAnswer(index, question.options.indexOf(selectedAnswer)));
    notifyListeners();
  }
}
