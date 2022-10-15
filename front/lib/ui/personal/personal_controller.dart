import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirai_nikki/domain/model/user_model.dart';
import 'package:mirai_nikki/domain/services/myApi/my_api.dart';
import 'package:mirai_nikki/domain/services/secure/secure.dart';
import 'package:mirai_nikki/domain/state/user_state.dart';
import 'package:mirai_nikki/domain/util/personal_util.dart';

abstract class PersonalController {
  Future<void> register(List<bool> list);
}

class PersonalControllerImpl implements PersonalController {
  final MyApiService api;
  final SecureStorage secure;
  final StateController<UserModel> userController;
  PersonalControllerImpl(this.api, this.secure, this.userController);
  @override
  Future<void> register(List<bool> list) async {
    final personal = booleans2Personal(list);
    final user = await api.register(personal);
    await secure.saveUser(user);
  }
}

final personalControllerProvider = Provider((ref) {
  final api = ref.watch(myApiProvider);
  final secure = ref.watch(secureStorageProvider);
  final user = ref.watch(userStateProvider.notifier);
  return PersonalControllerImpl(api, secure, user);
});
