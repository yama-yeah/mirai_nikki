import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    @Default("%VoidUser%") String uid, // Add your fields here
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
