// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'posts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostsModel _$PostsModelFromJson(Map<String, dynamic> json) {
  return _PostsModel.fromJson(json);
}

/// @nodoc
mixin _$PostsModel {
  List<PostModel> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostsModelCopyWith<PostsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsModelCopyWith<$Res> {
  factory $PostsModelCopyWith(
          PostsModel value, $Res Function(PostsModel) then) =
      _$PostsModelCopyWithImpl<$Res, PostsModel>;
  @useResult
  $Res call({List<PostModel> list});
}

/// @nodoc
class _$PostsModelCopyWithImpl<$Res, $Val extends PostsModel>
    implements $PostsModelCopyWith<$Res> {
  _$PostsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PostModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostsModelCopyWith<$Res>
    implements $PostsModelCopyWith<$Res> {
  factory _$$_PostsModelCopyWith(
          _$_PostsModel value, $Res Function(_$_PostsModel) then) =
      __$$_PostsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PostModel> list});
}

/// @nodoc
class __$$_PostsModelCopyWithImpl<$Res>
    extends _$PostsModelCopyWithImpl<$Res, _$_PostsModel>
    implements _$$_PostsModelCopyWith<$Res> {
  __$$_PostsModelCopyWithImpl(
      _$_PostsModel _value, $Res Function(_$_PostsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$_PostsModel(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PostModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class _$_PostsModel with DiagnosticableTreeMixin implements _PostsModel {
  const _$_PostsModel({final List<PostModel> list = const []}) : _list = list;

  factory _$_PostsModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostsModelFromJson(json);

  final List<PostModel> _list;
  @override
  @JsonKey()
  List<PostModel> get list {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostsModel(list: $list)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostsModel'))
      ..add(DiagnosticsProperty('list', list));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostsModel &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostsModelCopyWith<_$_PostsModel> get copyWith =>
      __$$_PostsModelCopyWithImpl<_$_PostsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostsModelToJson(
      this,
    );
  }
}

abstract class _PostsModel implements PostsModel {
  const factory _PostsModel({final List<PostModel> list}) = _$_PostsModel;

  factory _PostsModel.fromJson(Map<String, dynamic> json) =
      _$_PostsModel.fromJson;

  @override
  List<PostModel> get list;
  @override
  @JsonKey(ignore: true)
  _$$_PostsModelCopyWith<_$_PostsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
