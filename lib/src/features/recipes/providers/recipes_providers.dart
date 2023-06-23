import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:task_two/src/features/recipes/data_layer/firestore_recipes_repository.dart';


// ----------- Holding the Forms in the 'Add recipe page'  ----------------------------------
final recipeFormGroupProvider = Provider.autoDispose((ref) => FormGroup({
  'name': FormControl<String>(validators: [Validators.required, ]),
  'details': FormControl<String>(validators: [Validators.required, ]),
}),);


// ----------- Holding the items in the recipes category  --------------------------------
final recipesCategoryListProvider = StateNotifierProvider<RecipesCategoryList, List<String>>((ref) => RecipesCategoryList());
class RecipesCategoryList extends StateNotifier<List<String>> {
  RecipesCategoryList() : super(['Pastries', 'Grills', 'Soups', '+',]);

  void insertAtIndex(String item, int index) {
    state.insert(index, item);
  }

  void removeItem(String item) {
    state = state.where((element) => element != item).toList();
  }
}



// ----------- Controlling the category index and value ---------------------------------
final recipesCategorySelectorProvider = StateProvider<String>((ref) {
  return 'Pastries';
});

final recipesCategoryIndexProvider = StateProvider<int>((ref) {
  return 0;
});



// ----------- fetch data from Firestore database using Riverpod state management -----------
final getRecipesDataProvider = FutureProvider.autoDispose<List<QueryDocumentSnapshot>>((ref) async {
  final category = ref.watch(recipesCategorySelectorProvider);
  final itemsProvider = ref.watch(fireStoreRecipesProvider);
  final querySnapshot = (category != 'All') & (category != '+') ? itemsProvider.fetchRecipesByCategory(categoryName: category) : itemsProvider.fetchAllRecipes();
  return querySnapshot;
});
