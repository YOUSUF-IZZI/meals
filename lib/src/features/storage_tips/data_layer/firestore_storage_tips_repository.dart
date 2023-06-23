import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_two/src/features/storage_tips/data_layer/storage_tips_repository.dart';
import 'package:task_two/src/features/storage_tips/domain_layer/models/tip.dart';


 /* ------------------------------------------------------------------------------------------------------
 Creating a simple Riverpod provider that provides an instance of our Database class(FireStoreStorageTipsRepository) so that it can be used from our UI(by calling Database class methods)
 instead of creating object from this class whenever we want to use it we access this provider wherever we are
 ------------------------------------------------------------------------------------------------------- */
final fireStoreStorageTipsRepositoryProvider = Provider<FireStoreStorageTipsRepository>((ref) {
  return FireStoreStorageTipsRepository();
});


class FireStoreStorageTipsRepository implements StorageTipsRpositoty
{
  // Create instance from the collection
  CollectionReference storageTipRef = FirebaseFirestore.instance.collection('storageTips');

  @override
  Future<void> createStorageTips({required Tip tip}) async {
    return await  storageTipRef.add({
      'tipTitle': tip.tipTitle,
      'details': tip.details,
      'userId': FirebaseAuth.instance.currentUser?.uid,
      'category': tip.category
    }).then((value) => print("User Added")).
    catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Future<List<QueryDocumentSnapshot>> fetchAllStorageTips() async {
    final querySnapshot = await storageTipRef.get();
    return querySnapshot.docs;
  }


  @override
  Future<List<QueryDocumentSnapshot>> fetchStorageTipsByCategory({required String categoryName}) async {
    final querySnapshot = await storageTipRef.where('category', isEqualTo: categoryName).get();
    return querySnapshot.docs;
  }
}