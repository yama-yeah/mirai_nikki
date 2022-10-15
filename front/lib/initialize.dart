import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirai_nikki/domain/services/myApi/my_api.dart';
import 'package:mirai_nikki/domain/services/secure/secure.dart';
import 'package:mirai_nikki/domain/state/user_state.dart';

import 'domain/model/user_model.dart';

class InitializeStateNotifier extends StateNotifier<bool> {
  final StateController<UserModel> userStateController;
  final MyApiService api;
  final SecureStorage secure;
  InitializeStateNotifier(this.userStateController, this.api, this.secure)
      : super(false);
  void initialize() async {
    final user = await secure.loadUser();
    if (user == const UserModel()) {
      //final model = await api.register();
      //userStateController.state = model;
    } else {
      userStateController.state = user;
    }
    state = true;
  }
}

final initializeStateNotifierProvider =
    StateNotifierProvider<InitializeStateNotifier, bool>(
  (ref) {
    final userStateController = ref.read(userStateProvider.notifier);
    final api = ref.watch(myApiProvider);
    final secure = ref.watch(secureStorageProvider);
    return InitializeStateNotifier(userStateController, api, secure);
  },
);
