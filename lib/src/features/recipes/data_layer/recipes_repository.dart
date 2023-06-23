import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_two/src/features/recipes/domain_layer/models/recipe.dart';


abstract class RecipesRpository
{
  Future<void> createRecipe({required Recipe recipe});
  Future<String> uploadImageToFirebaseStorage({required File? recipeImageFile});
  Future<List<QueryDocumentSnapshot>> fetchAllRecipes();
  Future<List<QueryDocumentSnapshot>> fetchRecipesByCategory({required String categoryName});
}


