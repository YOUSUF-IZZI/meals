import 'dart:io';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:task_two/src/features/refrigerator/data_layer/firestore_refrigerator_items_repository.dart';
import 'package:task_two/src/features/refrigerator/data_layer/refrigerator_items_repository.dart';
import 'package:task_two/src/features/refrigerator/domain_layer/models/item.dart';



class ItemService
{
 RefrigeratorItemsRpositoty itemRepositoty = FireStoreRefrigeratorItemsRepository();
 Item? item ;
 String? imageUrl;
 Future<void> uploadDataToFirebase(FormGroup itemFormGroup, String categoryProvider, File? itemImageFile ) async {

  //uploading itemAvatar to firebase storage
  imageUrl = await itemRepositoty.uploadImageToFirebaseStorage(itemImageFile: itemImageFile);

  // initializing the item object
  item = Item(
      name: itemFormGroup.control('name').value,
      purchaseDate: itemFormGroup.control('purchaseDate').value,
      expirationDate: itemFormGroup.control('expirationDate').value,
      quantity: itemFormGroup.control('quantity').value ,
      unit: itemFormGroup.control('unit').value,
      marketName: itemFormGroup.control('marketName').value,
      notes: itemFormGroup.control('notes').value,
      category: categoryProvider,
      imageUrl: imageUrl!,

  );

  // Upload the fields using createRefrigeratorItem function
  await itemRepositoty.createRefrigeratorItem(item: item!);
 }
}

