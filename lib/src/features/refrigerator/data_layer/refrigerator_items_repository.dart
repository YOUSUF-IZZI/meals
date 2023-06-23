import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain_layer/models/item.dart';


abstract class RefrigeratorItemsRpositoty
{
  Future<void> createRefrigeratorItem({required Item item});
  Future<String> uploadImageToFirebaseStorage({required File? itemImageFile});
  Future<List<QueryDocumentSnapshot>> fetchAllItems();
  Future<List<QueryDocumentSnapshot>> fetchItemsByCategory({required String categoryName});
  Future<List<QueryDocumentSnapshot>> fetchItemsByName({required String itemName});
}