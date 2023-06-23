// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      name: json['name'] as String,
      purchaseDate: json['purchaseDate'] as String,
      expirationDate: json['expirationDate'] as String,
      quantity: json['quantity'] as String,
      unit: json['unit'] as String,
      marketName: json['marketName'] as String,
      notes: json['notes'] as String,
      imageUrl: json['imageUrl'] as String,
      category: json['category'] as String?,
      userId: json['userId'] as String?,
      tipId: json['tipId'] as String?,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'name': instance.name,
      'purchaseDate': instance.purchaseDate,
      'expirationDate': instance.expirationDate,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'marketName': instance.marketName,
      'notes': instance.notes,
      'imageUrl': instance.imageUrl,
      'category': instance.category,
      'userId': instance.userId,
      'tipId': instance.tipId,
    };
