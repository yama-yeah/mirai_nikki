import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:mirai_nikki/domain/model/personal_model.dart';
import 'package:mirai_nikki/domain/model/post_model.dart';
import 'package:mirai_nikki/domain/model/posts_model.dart';
import 'package:mirai_nikki/domain/model/user_model.dart';

import '../../util/service_util.dart';

abstract class MyApiService {
  Future<UserModel> register(PersonalModel personalModel);
  Future<PostsModel> fetchPosts(String uid);
  Future<PostModel> post(String uid);
  Future<void> updateImage(List<int> bytes, PostModel postModel);
  Future<void> updatePost(PostModel post);
}

class MyApiServiceImpl implements MyApiService {
  final URL = "http://yogen-nikki.miselogy.miraidai.fun/";

  @override
  Future<UserModel> register(PersonalModel personalModel) async {
    try {
      var raw = await http.post(
        Uri.parse('${URL}user'),
        headers: {'content-type': 'application/json'},
        body: jsonEncode(personalModel.toJson()),
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
        Uri.parse('${URL}posts/by-uid/$uid'),
        headers: {'content-type': 'application/json'},
      );
      //Logger().wtf(raw.body);
      final json = json2map(raw);
      return PostsModel.fromJson(json);
    } catch (e) {
      Logger().e(e);
      //throw Exception(e);
      return const PostsModel();
    }
  }

  @override
  Future<PostModel> post(String uid) async {
    final body = convert.json.encode({"uid": uid});
    try {
      var raw = await http.post(Uri.parse('${URL}post'),
          headers: {'content-type': 'application/json'}, body: body);
      Logger().d(raw.body);
      final json = json2map(raw);
      return PostModel.fromJson(json);
    } catch (e) {
      Logger().e(e);
      //throw Exception(e);
      return const PostModel();
    }
  }

  @override
  Future<void> updateImage(List<int> bytes, PostModel post) async {
    final body = convert.json.encode(bytes);
    try {
      var raw = await http.post(Uri.parse('${URL}image'),
          headers: {'content-type': 'application/json'}, body: body);
      Logger().d(raw.body);
      final json = json2map(raw);
      updatePost(post.copyWith(image: json["url"]));
    } catch (e) {
      Logger().e(e);
      //throw Exception(e);
    }
  }

  @override
  Future<void> updatePost(PostModel post) async {
    final body = convert.json.encode({
      "description": post.description,
      "image": post.image,
    });
    try {
      var raw = await http.put(Uri.parse('${URL}post/${post.id}'),
          headers: {'content-type': 'application/json'}, body: body);
    } catch (e) {
      Logger().e("Api:$e");
    }
  }
}

final myApiProvider = Provider<MyApiService>((ref) => MyApiServiceImpl());
