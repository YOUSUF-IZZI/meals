import 'package:flutter/material.dart';
import 'package:task_two/src/features/user_managements/domain_layer/models/users.dart';


abstract class UserRepository
{
  Future<void> login({required Users user,required BuildContext context});
  Future<void> register({required Users user, required BuildContext context});
}