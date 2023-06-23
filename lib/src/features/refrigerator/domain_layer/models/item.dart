import 'package:freezed_annotation/freezed_annotation.dart';


part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  const factory Item({
    required String name,
    required String purchaseDate,
    required String expirationDate,
    required String quantity,
    required String unit,
    required String marketName,
    required String notes,
    required String imageUrl,
    String? category,
    String? userId,
    String? tipId,
}) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);
}

/* -----------------------------------------------------
 use this to Upgrade:  flutter pub run build_runner build
 ------------------------------------------------------ */