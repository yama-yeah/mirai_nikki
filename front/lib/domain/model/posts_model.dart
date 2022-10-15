import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mirai_nikki/domain/model/post_model.dart';
part 'posts_model.freezed.dart';
part 'posts_model.g.dart';

@freezed
class PostsModel with _$PostsModel {
  @JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
  const factory PostsModel({
    @Default([]) List<PostModel> list, // Add your fields here
    @Default(false) bool isLoaded,
  }) = _PostsModel;
  factory PostsModel.fromJson(Map<String, dynamic> json) =>
      _$PostsModelFromJson(json);
}
