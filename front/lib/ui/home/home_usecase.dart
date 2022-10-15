import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirai_nikki/domain/model/post_model.dart';
import 'package:mirai_nikki/ui/home/home_controller.dart';
import 'package:mirai_nikki/ui/home/home_ui_model.dart';

class HomeUseCase {
  final StateController<HomeUiModel> uiModelController;
  HomeUseCase(this.uiModelController);
  void addPost(PostModel post) {
    uiModelController.state = uiModelController.state.copyWith(post: post);
  }
}

final homeUseCaseProvider = Provider((ref) {
  return HomeUseCase(ref.watch(homeUiModelProvider.notifier));
});
