import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'personal_model.freezed.dart';
part 'personal_model.g.dart';

@freezed
class PersonalModel with _$PersonalModel {
  const factory PersonalModel({
    @Default(true) bool outdoor,
    @Default(true) bool extrovert,
  }) = _PersonalModel;
  factory PersonalModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalModelFromJson(json);
}
