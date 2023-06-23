// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Users _$$_UsersFromJson(Map<String, dynamic> json) => _$_Users(
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      email: json['email'] as String,
      password: json['password'] as String,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      city: json['city'] as String?,
      district: json['district'] as String?,
    );

Map<String, dynamic> _$$_UsersToJson(_$_Users instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'password': instance.password,
      'birthday': instance.birthday?.toIso8601String(),
      'city': instance.city,
      'district': instance.district,
    };
