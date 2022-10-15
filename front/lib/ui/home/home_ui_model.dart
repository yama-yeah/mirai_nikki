import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirai_nikki/domain/model/post_model.dart';
import 'package:mirai_nikki/domain/model/posts_model.dart';
import 'package:mirai_nikki/domain/state/user_state.dart';
part 'home_ui_model.freezed.dart';
part 'home_ui_model.g.dart';

@freezed
class HomeUiModel with _$HomeUiModel {
  const factory HomeUiModel({
    @Default(PostModel()) PostModel post,
    @Default(PostsModel()) PostsModel posts,
  }) = _HomeUiModel;
  factory HomeUiModel.fromJson(Map<String, dynamic> json) =>
      _$HomeUiModelFromJson(json);
}

final homeUiModelProvider = StateProvider((ref) {
  final posts = ref.watch(postsStateProvider);
  final post = PostModel();
  return HomeUiModel(posts: posts, post: post);
});
