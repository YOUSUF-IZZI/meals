import 'package:freezed_annotation/freezed_annotation.dart';


part 'tip.freezed.dart';
part 'tip.g.dart';

@freezed
class Tip with _$Tip
{
  const factory Tip({
    required String tipTitle,
    required String details,
    String? category,
    String? userId,
    String? tipId,
}) = _Tip;

  factory Tip.fromJson(Map<String, Object?> json) => _$TipFromJson(json);
}




 /* -----------------------------------------------------
 use this to Upgrade:  flutter pub run build_runner build
 ------------------------------------------------------ */