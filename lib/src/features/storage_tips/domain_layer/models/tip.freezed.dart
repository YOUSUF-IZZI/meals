// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tip _$TipFromJson(Map<String, dynamic> json) {
  return _Tip.fromJson(json);
}

/// @nodoc
mixin _$Tip {
  String get tipTitle => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get tipId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TipCopyWith<Tip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipCopyWith<$Res> {
  factory $TipCopyWith(Tip value, $Res Function(Tip) then) =
      _$TipCopyWithImpl<$Res, Tip>;
  @useResult
  $Res call(
      {String tipTitle,
      String details,
      String? category,
      String? userId,
      String? tipId});
}

/// @nodoc
class _$TipCopyWithImpl<$Res, $Val extends Tip> implements $TipCopyWith<$Res> {
  _$TipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tipTitle = null,
    Object? details = null,
    Object? category = freezed,
    Object? userId = freezed,
    Object? tipId = freezed,
  }) {
    return _then(_value.copyWith(
      tipTitle: null == tipTitle
          ? _value.tipTitle
          : tipTitle // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      tipId: freezed == tipId
          ? _value.tipId
          : tipId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TipCopyWith<$Res> implements $TipCopyWith<$Res> {
  factory _$$_TipCopyWith(_$_Tip value, $Res Function(_$_Tip) then) =
      __$$_TipCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tipTitle,
      String details,
      String? category,
      String? userId,
      String? tipId});
}

/// @nodoc
class __$$_TipCopyWithImpl<$Res> extends _$TipCopyWithImpl<$Res, _$_Tip>
    implements _$$_TipCopyWith<$Res> {
  __$$_TipCopyWithImpl(_$_Tip _value, $Res Function(_$_Tip) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tipTitle = null,
    Object? details = null,
    Object? category = freezed,
    Object? userId = freezed,
    Object? tipId = freezed,
  }) {
    return _then(_$_Tip(
      tipTitle: null == tipTitle
          ? _value.tipTitle
          : tipTitle // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      tipId: freezed == tipId
          ? _value.tipId
          : tipId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tip implements _Tip {
  const _$_Tip(
      {required this.tipTitle,
      required this.details,
      this.category,
      this.userId,
      this.tipId});

  factory _$_Tip.fromJson(Map<String, dynamic> json) => _$$_TipFromJson(json);

  @override
  final String tipTitle;
  @override
  final String details;
  @override
  final String? category;
  @override
  final String? userId;
  @override
  final String? tipId;

  @override
  String toString() {
    return 'Tip(tipTitle: $tipTitle, details: $details, category: $category, userId: $userId, tipId: $tipId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tip &&
            (identical(other.tipTitle, tipTitle) ||
                other.tipTitle == tipTitle) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.tipId, tipId) || other.tipId == tipId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tipTitle, details, category, userId, tipId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TipCopyWith<_$_Tip> get copyWith =>
      __$$_TipCopyWithImpl<_$_Tip>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TipToJson(
      this,
    );
  }
}

abstract class _Tip implements Tip {
  const factory _Tip(
      {required final String tipTitle,
      required final String details,
      final String? category,
      final String? userId,
      final String? tipId}) = _$_Tip;

  factory _Tip.fromJson(Map<String, dynamic> json) = _$_Tip.fromJson;

  @override
  String get tipTitle;
  @override
  String get details;
  @override
  String? get category;
  @override
  String? get userId;
  @override
  String? get tipId;
  @override
  @JsonKey(ignore: true)
  _$$_TipCopyWith<_$_Tip> get copyWith => throw _privateConstructorUsedError;
}
