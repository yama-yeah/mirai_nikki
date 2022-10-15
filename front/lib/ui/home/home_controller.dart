import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirai_nikki/domain/model/post_model.dart';
import 'package:mirai_nikki/domain/model/user_model.dart';
import 'package:mirai_nikki/domain/services/myApi/my_api.dart';
import 'package:mirai_nikki/domain/state/user_state.dart';

import 'home_ui_model.dart';

class HomeControllerImpl implements HomeController {
  final MyApiService api;
  final UserModel user;
  HomeControllerImpl(
    this.api,
    this.user,
  );
  @override
  Future<PostModel> addPost() async {
    return await api.post(user.uid);
  }
}

abstract class HomeController {
  Future<PostModel> addPost();
}

final homeControllerProvider = Provider<HomeController>((ref) {
  final user = ref.watch(userStateProvider);
  final api = ref.watch(myApiProvider);
  return HomeControllerImpl(api, user);
});

final homeUiModelProvider = StateProvider((ref) {
  final posts = ref.watch(postsStateProvider);
  final post = PostModel();
  return HomeUiModel(posts: posts, post: post);
});
