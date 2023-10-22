import 'package:freezed_annotation/freezed_annotation.dart';
part 'road_sign_question_model.freezed.dart';

@freezed
class RoadSignQuestionModel with _$RoadSignQuestionModel {
  const factory RoadSignQuestionModel({
    required String imageUrl,
    required String answer,
  }) = _RoadSignQuestionModel;
}
