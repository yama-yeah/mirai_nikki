// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_ui_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeUiModel _$$_HomeUiModelFromJson(Map<String, dynamic> json) =>
    _$_HomeUiModel(
      post: json['post'] == null
          ? const PostModel()
          : PostModel.fromJson(json['post'] as Map<String, dynamic>),
      posts: json['posts'] == null
          ? const PostsModel()
          : PostsModel.fromJson(json['posts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_HomeUiModelToJson(_$_HomeUiModel instance) =>
    <String, dynamic>{
      'post': instance.post,
      'posts': instance.posts,
    };
