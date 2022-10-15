import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
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

class PostsStateNotifier extends StateNotifier<PostsModel> {
  PostsStateNotifier(this.user, this.api) : super(PostsModel());
  final UserModel user;
  final MyApiService api;
  fetchPosts() async {
    var posts = await api.fetchPosts(user.uid);
    Logger().d("fetched:$posts");
    posts = posts.copyWith(isLoaded: true);
    state = posts;
  }
}

final PostsStateNotifierProvider =
    StateNotifierProvider<PostsStateNotifier, PostsModel>((ref) {
  final user = ref.watch(userStateProvider);
  final api = ref.watch(myApiProvider);
  final provider = PostsStateNotifier(user, api);
  provider.fetchPosts();
  return provider;
});
