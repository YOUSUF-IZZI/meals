import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:task_two/src/features/storage_tips/data_layer/firestore_storage_tips_repository.dart';


// ----------- Holding the Forms in the 'Add recipe page'  ----------------------------------
final storageTipsFormGroupProvider = Provider.autoDispose((ref) => FormGroup({
  'tipTitle': FormControl<String>(validators: [Validators.required, ]),
  'details': FormControl<String>(validators: [Validators.required, ]),
}),);


// ----------- Controlling the category index and value ---------------------------------
final tipsCategorySelectorProvider = StateProvider<String>((ref) {
  return 'Groceries';
});

final tipsCategoryIndexProvider = StateProvider<int>((ref) {
  return 0;
});


// ----------- Holding the items in the items category  ------------------------------------
final storageTipsCategoryListProvider = StateNotifierProvider<TipsCategoryList, List<String>>((ref) => TipsCategoryList());
class TipsCategoryList extends StateNotifier<List<String>> {
  TipsCategoryList() : super(['Groceries', 'Dairy products', 'Meat products', '+',]);

  void insertAtIndex(String item, int index) {
    state.insert(index, item);
  }

  void removeItem(String item) {
    state = state.where((element) => element != item).toList();
  }
}


// ----------- fetch data from Firestore database using Riverpod state management -----------
final getStorageTipsDataProvider = FutureProvider.autoDispose<List<QueryDocumentSnapshot>>((ref) async {
  final category = ref.watch(tipsCategorySelectorProvider);
  final tipsProvider = ref.watch(fireStoreStorageTipsRepositoryProvider);
  final querySnapshot = (category != 'All') & (category != '+') ? tipsProvider.fetchStorageTipsByCategory(categoryName: category) : tipsProvider.fetchAllStorageTips();
  return querySnapshot;
});


