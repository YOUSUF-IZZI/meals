import 'package:freezed_annotation/freezed_annotation.dart';


part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe{
  const factory Recipe({
    required String name,
    required String details,
    required String imageUrl,
    String? category,
    String? userId,
    String? recipeId,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);
}


/* -----------------------------------------------------
 use this to Upgrade:  flutter pub run build_runner build
 ------------------------------------------------------ */