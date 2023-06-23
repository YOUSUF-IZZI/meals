import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserScoresBar extends StatelessWidget {
  const UserScoresBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text('150', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, letterSpacing: 0.15.sign),),
            Text('Following', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, letterSpacing: 0.15.sign),),
          ],
        ),
        SizedBox(width: 15,),
        Column(
          children: [
            Text('250', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, letterSpacing: 0.15.sign),),
            Text('Followers', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, letterSpacing: 0.15.sign),),
          ],
        ),
        SizedBox(width: 15,),
        Column(
          children: [
            Text('10', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, letterSpacing: 0.15.sign),),
            Text('Recipes', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, letterSpacing: 0.15.sign),),
          ],
        ),
        SizedBox(width: 15,),
        Column(
          children: [
            Text('5', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, letterSpacing: 0.15.sign),),
            Text('Favorites', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, letterSpacing: 0.15.sign),),
          ],
        )
      ],
    );
  }
}
