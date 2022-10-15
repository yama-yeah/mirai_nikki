import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirai_nikki/domain/services/myApi/my_api.dart';
import 'package:mirai_nikki/domain/state/user_state.dart';

import 'domain/model/user_model.dart';

class InitializeStateNotifier extends StateNotifier<bool> {
  final StateController<UserModel> userStateController;
  final MyApiService api;
  InitializeStateNotifier(this.userStateController, this.api) : super(false);
  void initialize() async {
    final uid = await const FlutterSecureStorage().read(key: 'uid');
    if (uid == null) {
      final model = await api.register();
      userStateController.state = model;
    } else {
      userStateController.state = UserModel(uid: uid);
    }
    state = true;
  }
}

final initializeStateNotifierProvider =
    StateNotifierProvider<InitializeStateNotifier, bool>(
  (ref) {
    final userStateController = ref.read(userStateProvider.notifier);
    return InitializeStateNotifier(userStateController, MyApiServiceImpl());
  },
);
