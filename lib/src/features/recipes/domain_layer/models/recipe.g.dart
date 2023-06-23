// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      name: json['name'] as String,
      details: json['details'] as String,
      imageUrl: json['imageUrl'] as String,
      category: json['category'] as String?,
      userId: json['userId'] as String?,
      recipeId: json['recipeId'] as String?,
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'name': instance.name,
      'details': instance.details,
      'imageUrl': instance.imageUrl,
      'category': instance.category,
      'userId': instance.userId,
      'recipeId': instance.recipeId,
    };
