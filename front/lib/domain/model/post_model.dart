import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    @Default("%VoidId%") String id,
    @Default("") String title,
    @Default("") String description,
    @Default("") String image,
    @Default(0) int deadline,
  }) = _PostModel;
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}

/*
Post{
  id	string
  example: 98857d7c281f5b77293fa5809227aa54
  投稿の内部ID

  title	string
  example: 今日はスキーに行きました！
  投稿のタイトル文字列

  description	string
  example: 〇〇さんが〇〇していて面白かった
  投稿の内容文字列(使わないかもだけど念の為)

  image	string
  example: https://i.imgur.com/ONrIv1S.png
  画像のURL(画像がない場合は砂嵐の画像が指定される)

  deadline	integer
  example: 1665812810
  期限(Unixタイムスタンプ) 
}*/