import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:task_two/src/features/user_managements/data_layer/firebase_users_repository.dart';
import 'package:task_two/src/features/user_managements/data_layer/users_repository.dart';
import 'package:task_two/src/features/user_managements/domain_layer/models/users.dart';

class UserServices
{
  Users? user;
  UserRepository firebaseUserRepository = FirebaseUserRepository();
  // ---------- Login method ----------
  Future<void> login(FormGroup loginPageFormGroup, BuildContext context) async {
    user = Users(
        email: loginPageFormGroup.control('email').value,
        password: loginPageFormGroup.control('password').value
    );
    await firebaseUserRepository.login(user: user!, context: context);
  }
  // ---------- Register method ----------
  Future<void> register(FormGroup registerPageFormGroup, BuildContext context) async {
    user = Users(
        email: registerPageFormGroup.control('email').value,
        password: registerPageFormGroup.control('password').value
    );
    await firebaseUserRepository.register(user: user!, context: context);
  }
}
