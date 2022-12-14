import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirai_nikki/domain/model/post_model.dart';
import 'package:mirai_nikki/domain/model/user_model.dart';
import 'package:mirai_nikki/domain/services/myApi/my_api.dart';
import 'package:mirai_nikki/domain/state/user_state.dart';
import 'package:mirai_nikki/initialize.dart';
import 'package:mirai_nikki/ui/home/home_usecase.dart';

import 'home_ui_model.dart';

class HomeControllerImpl implements HomeController {
  final MyApiService api;
  final UserModel user;
  final HomeUseCase useCase;
  final InitializeStateNotifier ini;
  HomeControllerImpl(
    this.api,
    this.user,
    this.useCase,
    this.ini,
  );
  @override
  Future<PostModel> addPost() async {
    final post = await api.post(user.uid);
    //useCase.addPost(post);
    return post;
  }

  @override
  Future<void> updateImage(Uint8List bytes, PostModel post) async {
    EasyLoading.show(status: 'uploading...');
    await api.updateImage(bytes, post);
    await ini.initialize();
    await EasyLoading.dismiss();
  }
}

abstract class HomeController {
  Future<PostModel> addPost();
  Future<void> updateImage(Uint8List bytes, PostModel postModel);
}

final homeControllerProvider = Provider<HomeController>((ref) {
  final user = ref.watch(userStateProvider);
  final api = ref.watch(myApiProvider);
  final useCase = ref.watch(homeUseCaseProvider);
  final ini = ref.watch(initializeStateNotifierProvider.notifier);
  return HomeControllerImpl(api, user, useCase, ini);
});

final homeUiModelProvider = StateProvider((ref) {
  final posts = ref.watch(postsStateNotifierProvider);
  const post = PostModel();
  return HomeUiModel(posts: posts, post: post);
});
