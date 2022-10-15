// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'personal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PersonalModel _$PersonalModelFromJson(Map<String, dynamic> json) {
  return _PersonalModel.fromJson(json);
}

/// @nodoc
mixin _$PersonalModel {
  bool get outdoor => throw _privateConstructorUsedError;
  bool get extrovert => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalModelCopyWith<PersonalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalModelCopyWith<$Res> {
  factory $PersonalModelCopyWith(
          PersonalModel value, $Res Function(PersonalModel) then) =
      _$PersonalModelCopyWithImpl<$Res, PersonalModel>;
  @useResult
  $Res call({bool outdoor, bool extrovert});
}

/// @nodoc
class _$PersonalModelCopyWithImpl<$Res, $Val extends PersonalModel>
    implements $PersonalModelCopyWith<$Res> {
  _$PersonalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outdoor = null,
    Object? extrovert = null,
  }) {
    return _then(_value.copyWith(
      outdoor: null == outdoor
          ? _value.outdoor
          : outdoor // ignore: cast_nullable_to_non_nullable
              as bool,
      extrovert: null == extrovert
          ? _value.extrovert
          : extrovert // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PersonalModelCopyWith<$Res>
    implements $PersonalModelCopyWith<$Res> {
  factory _$$_PersonalModelCopyWith(
          _$_PersonalModel value, $Res Function(_$_PersonalModel) then) =
      __$$_PersonalModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool outdoor, bool extrovert});
}

/// @nodoc
class __$$_PersonalModelCopyWithImpl<$Res>
    extends _$PersonalModelCopyWithImpl<$Res, _$_PersonalModel>
    implements _$$_PersonalModelCopyWith<$Res> {
  __$$_PersonalModelCopyWithImpl(
      _$_PersonalModel _value, $Res Function(_$_PersonalModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outdoor = null,
    Object? extrovert = null,
  }) {
    return _then(_$_PersonalModel(
      outdoor: null == outdoor
          ? _value.outdoor
          : outdoor // ignore: cast_nullable_to_non_nullable
              as bool,
      extrovert: null == extrovert
          ? _value.extrovert
          : extrovert // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PersonalModel with DiagnosticableTreeMixin implements _PersonalModel {
  const _$_PersonalModel({this.outdoor = true, this.extrovert = true});

  factory _$_PersonalModel.fromJson(Map<String, dynamic> json) =>
      _$$_PersonalModelFromJson(json);

  @override
  @JsonKey()
  final bool outdoor;
  @override
  @JsonKey()
  final bool extrovert;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersonalModel(outdoor: $outdoor, extrovert: $extrovert)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersonalModel'))
      ..add(DiagnosticsProperty('outdoor', outdoor))
      ..add(DiagnosticsProperty('extrovert', extrovert));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PersonalModel &&
            (identical(other.outdoor, outdoor) || other.outdoor == outdoor) &&
            (identical(other.extrovert, extrovert) ||
                other.extrovert == extrovert));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, outdoor, extrovert);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PersonalModelCopyWith<_$_PersonalModel> get copyWith =>
      __$$_PersonalModelCopyWithImpl<_$_PersonalModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PersonalModelToJson(
      this,
    );
  }
}

abstract class _PersonalModel implements PersonalModel {
  const factory _PersonalModel({final bool outdoor, final bool extrovert}) =
      _$_PersonalModel;

  factory _PersonalModel.fromJson(Map<String, dynamic> json) =
      _$_PersonalModel.fromJson;

  @override
  bool get outdoor;
  @override
  bool get extrovert;
  @override
  @JsonKey(ignore: true)
  _$$_PersonalModelCopyWith<_$_PersonalModel> get copyWith =>
      throw _privateConstructorUsedError;
}
