// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tip _$$_TipFromJson(Map<String, dynamic> json) => _$_Tip(
      tipTitle: json['tipTitle'] as String,
      details: json['details'] as String,
      category: json['category'] as String?,
      userId: json['userId'] as String?,
      tipId: json['tipId'] as String?,
    );

Map<String, dynamic> _$$_TipToJson(_$_Tip instance) => <String, dynamic>{
      'tipTitle': instance.tipTitle,
      'details': instance.details,
      'category': instance.category,
      'userId': instance.userId,
      'tipId': instance.tipId,
    };
