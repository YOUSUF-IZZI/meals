import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:task_two/src/features/refrigerator/data_layer/firestore_refrigerator_items_repository.dart';



// ----------- Holding the Forms in the 'Add item page'  ----------------------------------
final itemFormGroupProvider = Provider.autoDispose((ref) => FormGroup({
  'name': FormControl<String>(validators: [Validators.required, ]),
  'purchaseDate': FormControl<String>(validators: [Validators.required, ]),
  'expirationDate': FormControl<String>(validators: [Validators.required, ]),
  'quantity': FormControl<String>(validators: [Validators.required,]),
  'unit': FormControl<String>(validators: [Validators.required, ]),
  'marketName': FormControl<String>(validators: [Validators.required, ]),
  'notes': FormControl<String>(validators: [Validators.required, ]),
}),);


// ----------- Holding the items in the items category  --------------------------------
final itemsCategoryListProvider = StateNotifierProvider<ItemsCategoryList, List<String>>((ref) => ItemsCategoryList());
class ItemsCategoryList extends StateNotifier<List<String>> {
  ItemsCategoryList() : super(['Groceries', 'Dairy products', 'Meat products', '+',]);

  void insertAtIndex(String item, int index) {
    state.insert(index, item);
  }

  void removeItem(String item) {
    state = state.where((element) => element != item).toList();
  }
}


// ----------- Controlling the category index and value ---------------------------------
final itemsCategorySelectorProvider = StateProvider.autoDispose<String>((ref) {
  return 'Groceries';
});

final itemsCategoryIndexProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});


// ----------- fetch data from Firestore database using Riverpod state management -----------
final getItemsDataProvider = FutureProvider.autoDispose<List<QueryDocumentSnapshot>>((ref) async {
  final category = ref.watch(itemsCategorySelectorProvider);
  final itemsProvider = ref.watch(fireStoreRefrigeratorItemsProvider);
  final querySnapshot = (category != 'All') & (category != '+') ? itemsProvider.fetchItemsByCategory(categoryName: category) : itemsProvider.fetchAllItems();
  return querySnapshot;
});

