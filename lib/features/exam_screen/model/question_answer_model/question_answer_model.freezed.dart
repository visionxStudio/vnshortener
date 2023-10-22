// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question_answer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QuestionAnswerModelTearOff {
  const _$QuestionAnswerModelTearOff();

  _QuestionAnswerModel call(
      {required String question,
      required List<String> options,
      required String answer,
      required String image,
      int? userAnswer,
      bool? isCorrect}) {
    return _QuestionAnswerModel(
      question: question,
      options: options,
      answer: answer,
      image: image,
      userAnswer: userAnswer,
      isCorrect: isCorrect,
    );
  }
}

/// @nodoc
const $QuestionAnswerModel = _$QuestionAnswerModelTearOff();

/// @nodoc
mixin _$QuestionAnswerModel {
  String get question => throw _privateConstructorUsedError;
  List<String> get options => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int? get userAnswer => throw _privateConstructorUsedError;
  bool? get isCorrect => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionAnswerModelCopyWith<QuestionAnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionAnswerModelCopyWith<$Res> {
  factory $QuestionAnswerModelCopyWith(
          QuestionAnswerModel value, $Res Function(QuestionAnswerModel) then) =
      _$QuestionAnswerModelCopyWithImpl<$Res>;
  $Res call(
      {String question,
      List<String> options,
      String answer,
      String image,
      int? userAnswer,
      bool? isCorrect});
}

/// @nodoc
class _$QuestionAnswerModelCopyWithImpl<$Res>
    implements $QuestionAnswerModelCopyWith<$Res> {
  _$QuestionAnswerModelCopyWithImpl(this._value, this._then);

  final QuestionAnswerModel _value;
  // ignore: unused_field
  final $Res Function(QuestionAnswerModel) _then;

  @override
  $Res call({
    Object? question = freezed,
    Object? options = freezed,
    Object? answer = freezed,
    Object? image = freezed,
    Object? userAnswer = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(_value.copyWith(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      userAnswer: userAnswer == freezed
          ? _value.userAnswer
          : userAnswer // ignore: cast_nullable_to_non_nullable
              as int?,
      isCorrect: isCorrect == freezed
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$QuestionAnswerModelCopyWith<$Res>
    implements $QuestionAnswerModelCopyWith<$Res> {
  factory _$QuestionAnswerModelCopyWith(_QuestionAnswerModel value,
          $Res Function(_QuestionAnswerModel) then) =
      __$QuestionAnswerModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String question,
      List<String> options,
      String answer,
      String image,
      int? userAnswer,
      bool? isCorrect});
}

/// @nodoc
class __$QuestionAnswerModelCopyWithImpl<$Res>
    extends _$QuestionAnswerModelCopyWithImpl<$Res>
    implements _$QuestionAnswerModelCopyWith<$Res> {
  __$QuestionAnswerModelCopyWithImpl(
      _QuestionAnswerModel _value, $Res Function(_QuestionAnswerModel) _then)
      : super(_value, (v) => _then(v as _QuestionAnswerModel));

  @override
  _QuestionAnswerModel get _value => super._value as _QuestionAnswerModel;

  @override
  $Res call({
    Object? question = freezed,
    Object? options = freezed,
    Object? answer = freezed,
    Object? image = freezed,
    Object? userAnswer = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(_QuestionAnswerModel(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      userAnswer: userAnswer == freezed
          ? _value.userAnswer
          : userAnswer // ignore: cast_nullable_to_non_nullable
              as int?,
      isCorrect: isCorrect == freezed
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_QuestionAnswerModel implements _QuestionAnswerModel {
  const _$_QuestionAnswerModel(
      {required this.question,
      required this.options,
      required this.answer,
      required this.image,
      this.userAnswer,
      this.isCorrect});

  @override
  final String question;
  @override
  final List<String> options;
  @override
  final String answer;
  @override
  final String image;
  @override
  final int? userAnswer;
  @override
  final bool? isCorrect;

  @override
  String toString() {
    return 'QuestionAnswerModel(question: $question, options: $options, answer: $answer, image: $image, userAnswer: $userAnswer, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestionAnswerModel &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other.options, options) &&
            const DeepCollectionEquality().equals(other.answer, answer) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality()
                .equals(other.userAnswer, userAnswer) &&
            const DeepCollectionEquality().equals(other.isCorrect, isCorrect));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(options),
      const DeepCollectionEquality().hash(answer),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(userAnswer),
      const DeepCollectionEquality().hash(isCorrect));

  @JsonKey(ignore: true)
  @override
  _$QuestionAnswerModelCopyWith<_QuestionAnswerModel> get copyWith =>
      __$QuestionAnswerModelCopyWithImpl<_QuestionAnswerModel>(
          this, _$identity);
}

abstract class _QuestionAnswerModel implements QuestionAnswerModel {
  const factory _QuestionAnswerModel(
      {required String question,
      required List<String> options,
      required String answer,
      required String image,
      int? userAnswer,
      bool? isCorrect}) = _$_QuestionAnswerModel;

  @override
  String get question;
  @override
  List<String> get options;
  @override
  String get answer;
  @override
  String get image;
  @override
  int? get userAnswer;
  @override
  bool? get isCorrect;
  @override
  @JsonKey(ignore: true)
  _$QuestionAnswerModelCopyWith<_QuestionAnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
