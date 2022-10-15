import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirai_nikki/domain/model/posts_model.dart';
import 'package:mirai_nikki/domain/model/user_model.dart';
import 'package:mirai_nikki/domain/services/myApi/my_api.dart';

final userStateProvider = StateProvider((ref) => const UserModel());
final postsFutureProvider = FutureProvider((ref) {
  //許して
  final user = ref.watch(userStateProvider);
  final api = ref.watch(myApiProvider);
  return api.fetchPosts(user.uid);
});

final postsStateProvider = StateProvider((ref) {
  PostsModel state = const PostsModel();
  ref.watch(postsFutureProvider).when(
      data: (data) {
        state = data;
      },
      error: (error, stackTrace) {},
      loading: () {});
  return state;
});
