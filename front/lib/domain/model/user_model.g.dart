// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      uid: json['uid'] as String? ?? "%VoidUserModel%",
      outdoor: json['outdoor'] as bool? ?? true,
      extrovert: json['extrovert'] as bool? ?? true,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'outdoor': instance.outdoor,
      'extrovert': instance.extrovert,
    };
