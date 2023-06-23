import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:task_two/src/features/refrigerator/data_layer/refrigerator_items_repository.dart';
import 'package:task_two/src/features/refrigerator/domain_layer/models/item.dart';



final fireStoreRefrigeratorItemsProvider = Provider<FireStoreRefrigeratorItemsRepository>((ref) {
  return FireStoreRefrigeratorItemsRepository();
});


class FireStoreRefrigeratorItemsRepository implements RefrigeratorItemsRpositoty
{
  CollectionReference itemRef = FirebaseFirestore.instance.collection('items');
  @override
  Future<void> createRefrigeratorItem({required Item item}) async {
    return await itemRef.add({
      'name' : item.name,
      'purchaseDate' : item.purchaseDate,
      'expirationDate' : item.expirationDate,
      'quantity' : item.quantity,
      'unit' : item.unit,
      'marketName' : item.marketName,
      'notes' : item.notes,
      'category' : item.category,
      'userId': FirebaseAuth.instance.currentUser?.uid,
      'imageUrl' : item.imageUrl
    }).then((value) => print("User Added")).
    catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Future<String> uploadImageToFirebaseStorage({required File? itemImageFile}) async {
    var imageName = basename(itemImageFile!.path);
    //aceess the FirebaseFireStorage and setting the path we want to upload image to
    var imageFullPath = FirebaseStorage.instance.ref("images/$imageName");
    //Upload operation
    await imageFullPath.putFile(itemImageFile);
    // returning the image Url
    String imageUrl = await imageFullPath.getDownloadURL();
    return imageUrl;
  }

  @override
  Future<List<QueryDocumentSnapshot<Object?>>> fetchAllItems() async {
    final querySnapshot = await itemRef.where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid.toString() ).get();
    return querySnapshot.docs;
  }

  @override
  Future<List<QueryDocumentSnapshot<Object?>>> fetchItemsByCategory({required String categoryName}) async {
    final querySnapshot = await itemRef.where('category', isEqualTo: categoryName).where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid.toString()).get();
    return querySnapshot.docs;
  }

  @override
  Future<List<QueryDocumentSnapshot<Object?>>> fetchItemsByName({required String itemName}) async{
    final querySnapshot = await itemRef.where('name', isEqualTo: itemName).where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid.toString()).get();
    return querySnapshot.docs;
  }
}