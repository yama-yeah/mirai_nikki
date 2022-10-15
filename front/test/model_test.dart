import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mirai_nikki/domain/model/post_model.dart';
import 'package:mirai_nikki/domain/model/user_model.dart';

void main() {
  test('model test', () async {
    Logger().d(const User());
    Logger().d(const PostModel());
  });
}
