import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirai_nikki/domain/services/myApi/my_api.dart';
import 'package:mirai_nikki/domain/services/secure/secure.dart';
import 'package:mirai_nikki/domain/util/personal_util.dart';

abstract class PersonalController {
  Future<void> register(List<bool> list);
}

class PersonalControllerImpl implements PersonalController {
  final MyApiService api;
  final SecureStorage secure;
  PersonalControllerImpl(this.api, this.secure);
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
  return PersonalControllerImpl(api, secure);
});
