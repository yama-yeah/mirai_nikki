import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirai_nikki/domain/model/user_model.dart';

abstract class SecureStorage {
  Future<void> saveUser(UserModel user);
  Future<UserModel> loadUser();
}

class SecureStorageImpl implements SecureStorage {
  @override
  Future<UserModel> loadUser() async {
    final json = await const FlutterSecureStorage().read(key: 'user');
    return json == null
        ? const UserModel()
        : UserModel.fromJson(jsonDecode(json));
  }

  @override
  Future<void> saveUser(UserModel user) async {
    await const FlutterSecureStorage()
        .write(key: 'user', value: jsonEncode(user.toJson()));
  }
}

final secureStorageProvider = Provider<SecureStorage>(
  (ref) {
    return SecureStorageImpl();
  },
);
