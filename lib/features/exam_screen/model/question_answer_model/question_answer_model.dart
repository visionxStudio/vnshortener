import 'package:freezed_annotation/freezed_annotation.dart';
part 'question_answer_model.freezed.dart';

@freezed
class QuestionAnswerModel with _$QuestionAnswerModel {
  const factory QuestionAnswerModel({
    required String question,
    required List<String> options,
    required String answer,
    required String image,
    int? userAnswer,
    bool? isCorrect,
  }) = _QuestionAnswerModel;
}
