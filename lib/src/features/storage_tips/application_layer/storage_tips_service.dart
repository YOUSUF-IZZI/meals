import 'package:reactive_forms/reactive_forms.dart';
import 'package:task_two/src/features/storage_tips/data_layer/firestore_storage_tips_repository.dart';
import 'package:task_two/src/features/storage_tips/data_layer/storage_tips_repository.dart';
import 'package:task_two/src/features/storage_tips/domain_layer/models/tip.dart';


class StorageTipsService
{
  StorageTipsRpositoty firestoreStorageTipsRepository = FireStoreStorageTipsRepository();
  Tip? tip ;

  Future<void> createStorageTips(FormGroup tipFormGroup, String categoryProvider) async {
    tip=Tip(tipTitle: tipFormGroup.control('tipTitle').value, details: tipFormGroup.control('details').value, category: categoryProvider);
    await firestoreStorageTipsRepository.createStorageTips(tip: tip!);
  }

}