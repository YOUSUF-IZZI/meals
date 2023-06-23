import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:task_two/src/features/recipes/domain_layer/models/recipe.dart';
import 'recipes_repository.dart';



final fireStoreRecipesProvider = Provider<FireStoreRecipesRepository>((ref) {
  return FireStoreRecipesRepository();
});


class FireStoreRecipesRepository implements RecipesRpository
{
  CollectionReference recipeRef = FirebaseFirestore.instance.collection('recipes');
  @override
  Future<void> createRecipe({required Recipe recipe}) async {
    return await recipeRef.add({
      'name' : recipe.name,
      'details' : recipe.details,
      'category' : recipe.category,
      'userId': FirebaseAuth.instance.currentUser?.uid,
      'imageUrl' : recipe.imageUrl
    }).then((value) => print("User Added")).
    catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Future<String> uploadImageToFirebaseStorage({required File? recipeImageFile}) async {
    var imageName = basename(recipeImageFile!.path);
    //aceess the FirebaseFireStorage and setting the path we want to upload image to
    var imageFullPath = FirebaseStorage.instance.ref("images/$imageName");
    //Upload operation
    await imageFullPath.putFile(recipeImageFile);
    // returning the image Url
    String imageUrl = await imageFullPath.getDownloadURL();
    return imageUrl;
  }

  @override
  Future<List<QueryDocumentSnapshot<Object?>>> fetchAllRecipes() async {
    final querySnapshot = await recipeRef.get();
    return querySnapshot.docs;
  }

  @override
  Future<List<QueryDocumentSnapshot<Object?>>> fetchRecipesByCategory({required String categoryName}) async {
    final querySnapshot = await recipeRef.where('category', isEqualTo: categoryName).get();
    return querySnapshot.docs;
  }
}