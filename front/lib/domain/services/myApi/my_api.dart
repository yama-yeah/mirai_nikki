import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:mirai_nikki/domain/model/post_model.dart';
import 'package:mirai_nikki/domain/model/posts_model.dart';
import 'package:mirai_nikki/domain/model/user_model.dart';

import '../../util/service_util.dart';

abstract class MyApiService {
  Future<UserModel> register();
  Future<PostsModel> fetchPosts(String uid);
  Future<PostModel> post(String uid);
}

class MyApiServiceImpl implements MyApiService {
  final URL = "https://virtserver.swaggerhub.com/cathiecode/mirai_nikki/1.0.0/";

  @override
  Future<UserModel> register() async {
    try {
      var raw = await http.post(
        Uri.parse('${URL}user'),
        headers: {'accept': 'application/json'},
      );
      final json = json2map(raw);

      return UserModel.fromJson(json);
    } catch (e) {
      Logger().e("Api:$e");
      //throw Exception(e);
      return const UserModel();
    }
  }

  @override
  Future<PostsModel> fetchPosts(String uid) async {
    try {
      var raw = await http.get(
        Uri.parse('${URL}posts/by-uid/${uid}'),
        headers: {'accept': 'application/json'},
      );
      final json = json2map(raw);
      return PostsModel.fromJson(json);
    } catch (e) {
      Logger().e("Api:$e");
      //throw Exception(e);
      return const PostsModel();
    }
  }

  @override
  Future<PostModel> post(String uid) async {
    final body = convert.json.encode({"uid": uid});
    try {
      var raw = await http.post(Uri.parse('${URL}post'),
          headers: {'accept': 'application/json'}, body: body);
      final json = json2map(raw);
      return PostModel.fromJson(json);
    } catch (e) {
      Logger().e("Api:$e");
      //throw Exception(e);
      return const PostModel();
    }
  }
}

final myApiProvider = Provider<MyApiService>((ref) => MyApiServiceImpl());
