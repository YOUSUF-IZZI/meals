import 'dart:io';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:task_two/src/features/recipes/data_layer/firestore_recipes_repository.dart';
import 'package:task_two/src/features/recipes/data_layer/recipes_repository.dart';
import 'package:task_two/src/features/recipes/domain_layer/models/recipe.dart';



class RecipeService
{
 RecipesRpository recipesRepositoty = FireStoreRecipesRepository();
 Recipe? recipe ;
 String? imageUrl;
 Future<void> uploadDataToFirebase(FormGroup recipeFormGroup, String categoryProvider, File? recipeImageFile ) async {
   //uploading itemAvatar to firebase storage
   imageUrl = await recipesRepositoty.uploadImageToFirebaseStorage(recipeImageFile: recipeImageFile);

   // initializing the recipe object
   recipe = Recipe(
     name: recipeFormGroup.control('name').value,
     details: recipeFormGroup.control('details').value,
     category: categoryProvider,
     imageUrl: imageUrl!,

   );

  // Upload the fields using createRefrigeratorItem function
  await recipesRepositoty.createRecipe(recipe: recipe!);
 }
}

