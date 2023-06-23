import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task_two/src/common/common_components/loge_bar_component.dart';
import 'package:task_two/src/features/profile/presentaion_layer/components/user_scores_bar.dart';
import 'package:task_two/src/features/user_managements/presentation_layer/pages/auth_checker.dart';


class MyProfilePage extends StatelessWidget {
  MyProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 4.w),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const LogoBar(),
              SizedBox(height: 9.17.h,),
              Text('My Profile', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
              SizedBox(height: 4.h,),
              Text('Check Your Recipes and more..', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, letterSpacing: 0.5.sp), textAlign: TextAlign.center),
              SizedBox(height: 7.h,),
              Center(
                child: Container(
                  child: Stack(
                    children: <Widget> [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 75.sp,
                        child: Image(image: AssetImage('assets/images/profile_image.png')),
                      ),
                      Positioned(
                          right: 0, bottom: 10.sp,
                          child:
                          CircleAvatar(
                            backgroundColor: Color(0xff575E71),
                            radius: 15.sp,
                            child: Image(image: AssetImage('assets/icons/pencil.png'), width: 20.w,),
                          )
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.h,),
              Text('Full Name', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
              SizedBox(height: 8.h,),
              const UserScoresBar(),
              SizedBox(height: 8.h,),
              ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    context.go('/AuthPage');
                  },
                  child: Text('Log out'))
            ],
          ),
        ),
      ),
    );
  }
}
