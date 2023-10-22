// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'road_sign_question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoadSignQuestionModel {
  String get imageUrl => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoadSignQuestionModelCopyWith<RoadSignQuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoadSignQuestionModelCopyWith<$Res> {
  factory $RoadSignQuestionModelCopyWith(RoadSignQuestionModel value,
          $Res Function(RoadSignQuestionModel) then) =
      _$RoadSignQuestionModelCopyWithImpl<$Res>;
  $Res call({String imageUrl, String answer});
}

/// @nodoc
class _$RoadSignQuestionModelCopyWithImpl<$Res>
    implements $RoadSignQuestionModelCopyWith<$Res> {
  _$RoadSignQuestionModelCopyWithImpl(this._value, this._then);

  final RoadSignQuestionModel _value;
  // ignore: unused_field
  final $Res Function(RoadSignQuestionModel) _then;

  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RoadSignQuestionModelCopyWith<$Res>
    implements $RoadSignQuestionModelCopyWith<$Res> {
  factory _$$_RoadSignQuestionModelCopyWith(_$_RoadSignQuestionModel value,
          $Res Function(_$_RoadSignQuestionModel) then) =
      __$$_RoadSignQuestionModelCopyWithImpl<$Res>;
  @override
  $Res call({String imageUrl, String answer});
}

/// @nodoc
class __$$_RoadSignQuestionModelCopyWithImpl<$Res>
    extends _$RoadSignQuestionModelCopyWithImpl<$Res>
    implements _$$_RoadSignQuestionModelCopyWith<$Res> {
  __$$_RoadSignQuestionModelCopyWithImpl(_$_RoadSignQuestionModel _value,
      $Res Function(_$_RoadSignQuestionModel) _then)
      : super(_value, (v) => _then(v as _$_RoadSignQuestionModel));

  @override
  _$_RoadSignQuestionModel get _value =>
      super._value as _$_RoadSignQuestionModel;

  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$_RoadSignQuestionModel(
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RoadSignQuestionModel implements _RoadSignQuestionModel {
  const _$_RoadSignQuestionModel(
      {required this.imageUrl, required this.answer});

  @override
  final String imageUrl;
  @override
  final String answer;

  @override
  String toString() {
    return 'RoadSignQuestionModel(imageUrl: $imageUrl, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoadSignQuestionModel &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.answer, answer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(answer));

  @JsonKey(ignore: true)
  @override
  _$$_RoadSignQuestionModelCopyWith<_$_RoadSignQuestionModel> get copyWith =>
      __$$_RoadSignQuestionModelCopyWithImpl<_$_RoadSignQuestionModel>(
          this, _$identity);
}

abstract class _RoadSignQuestionModel implements RoadSignQuestionModel {
  const factory _RoadSignQuestionModel(
      {required final String imageUrl,
      required final String answer}) = _$_RoadSignQuestionModel;

  @override
  String get imageUrl => throw _privateConstructorUsedError;
  @override
  String get answer => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoadSignQuestionModelCopyWith<_$_RoadSignQuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
