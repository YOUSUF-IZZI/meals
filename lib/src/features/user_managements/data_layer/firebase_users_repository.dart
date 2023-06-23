import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_two/src/features/user_managements/data_layer/users_repository.dart';
import 'package:task_two/src/features/user_managements/domain_layer/models/users.dart';


final firebaseUserRepositoryProvider = Provider<FirebaseUserRepository>((ref) {
  return FirebaseUserRepository();
});

class FirebaseUserRepository implements UserRepository
{
  final CollectionReference userRef = FirebaseFirestore.instance.collection('users');
  @override
  Future<void> login({required Users user, required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email,
          password: user.password
      );
      context.go('/MyRefridgeratorPage');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }


  @override
  Future<void> register({required Users user, required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      context.go('/LoginPage');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

}