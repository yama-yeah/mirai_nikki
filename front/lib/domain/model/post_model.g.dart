// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
      id: json['id'] as String? ?? "%VoidUser%",
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      image: json['image'] as String? ?? "",
      deadline: json['deadline'] as int? ?? 0,
    );

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'deadline': instance.deadline,
    };
