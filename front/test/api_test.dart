import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mirai_nikki/domain/model/personal_model.dart';
import 'package:mirai_nikki/domain/services/myApi/my_api.dart';

void main() {
  final MyApiService api = MyApiServiceImpl();
  test('api test', () async {
    final model = await api.register(const PersonalModel());
    Logger().d(model);
    final posts = await api.fetchPosts("xxx");
    Logger().d(posts);
    final post = await api.post("ccc");
    Logger().d(post);
  });
}
