import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_two/src/features/storage_tips/domain_layer/models/tip.dart';


abstract class StorageTipsRpositoty
{
  Future<void> createStorageTips({required Tip tip});
  Future<List<QueryDocumentSnapshot>> fetchAllStorageTips();
  Future<List<QueryDocumentSnapshot>> fetchStorageTipsByCategory({required String categoryName});
  //Future<Tip> fetchStorageTipByName({required String tipTitle});
}