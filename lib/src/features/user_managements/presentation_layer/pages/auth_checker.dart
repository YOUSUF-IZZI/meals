import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_two/src/features/user_managements/presentation_layer/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Future.delayed(Duration.zero, () {
              context.go('/MyRefridgeratorPage');
            });
          } else {
            return LoginPage();
          }
          return LoginPage();
        },
      ),
    );
  }
}