// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeUiModel _$HomeUiModelFromJson(Map<String, dynamic> json) {
  return _HomeUiModel.fromJson(json);
}

/// @nodoc
mixin _$HomeUiModel {
  PostModel get post => throw _privateConstructorUsedError;
  PostsModel get posts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeUiModelCopyWith<HomeUiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeUiModelCopyWith<$Res> {
  factory $HomeUiModelCopyWith(
          HomeUiModel value, $Res Function(HomeUiModel) then) =
      _$HomeUiModelCopyWithImpl<$Res, HomeUiModel>;
  @useResult
  $Res call({PostModel post, PostsModel posts});

  $PostModelCopyWith<$Res> get post;
  $PostsModelCopyWith<$Res> get posts;
}

/// @nodoc
class _$HomeUiModelCopyWithImpl<$Res, $Val extends HomeUiModel>
    implements $HomeUiModelCopyWith<$Res> {
  _$HomeUiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
    Object? posts = null,
  }) {
    return _then(_value.copyWith(
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as PostModel,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as PostsModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostModelCopyWith<$Res> get post {
    return $PostModelCopyWith<$Res>(_value.post, (value) {
      return _then(_value.copyWith(post: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PostsModelCopyWith<$Res> get posts {
    return $PostsModelCopyWith<$Res>(_value.posts, (value) {
      return _then(_value.copyWith(posts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HomeUiModelCopyWith<$Res>
    implements $HomeUiModelCopyWith<$Res> {
  factory _$$_HomeUiModelCopyWith(
          _$_HomeUiModel value, $Res Function(_$_HomeUiModel) then) =
      __$$_HomeUiModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PostModel post, PostsModel posts});

  @override
  $PostModelCopyWith<$Res> get post;
  @override
  $PostsModelCopyWith<$Res> get posts;
}

/// @nodoc
class __$$_HomeUiModelCopyWithImpl<$Res>
    extends _$HomeUiModelCopyWithImpl<$Res, _$_HomeUiModel>
    implements _$$_HomeUiModelCopyWith<$Res> {
  __$$_HomeUiModelCopyWithImpl(
      _$_HomeUiModel _value, $Res Function(_$_HomeUiModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
    Object? posts = null,
  }) {
    return _then(_$_HomeUiModel(
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as PostModel,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as PostsModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomeUiModel with DiagnosticableTreeMixin implements _HomeUiModel {
  const _$_HomeUiModel(
      {this.post = const PostModel(), this.posts = const PostsModel()});

  factory _$_HomeUiModel.fromJson(Map<String, dynamic> json) =>
      _$$_HomeUiModelFromJson(json);

  @override
  @JsonKey()
  final PostModel post;
  @override
  @JsonKey()
  final PostsModel posts;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeUiModel(post: $post, posts: $posts)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeUiModel'))
      ..add(DiagnosticsProperty('post', post))
      ..add(DiagnosticsProperty('posts', posts));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeUiModel &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.posts, posts) || other.posts == posts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, post, posts);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeUiModelCopyWith<_$_HomeUiModel> get copyWith =>
      __$$_HomeUiModelCopyWithImpl<_$_HomeUiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomeUiModelToJson(
      this,
    );
  }
}

abstract class _HomeUiModel implements HomeUiModel {
  const factory _HomeUiModel({final PostModel post, final PostsModel posts}) =
      _$_HomeUiModel;

  factory _HomeUiModel.fromJson(Map<String, dynamic> json) =
      _$_HomeUiModel.fromJson;

  @override
  PostModel get post;
  @override
  PostsModel get posts;
  @override
  @JsonKey(ignore: true)
  _$$_HomeUiModelCopyWith<_$_HomeUiModel> get copyWith =>
      throw _privateConstructorUsedError;
}
