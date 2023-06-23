import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/features/recipes/domain_layer/models/recipe.dart';


class RecipeCard extends StatelessWidget {

  final Recipe recipe;
  const RecipeCard({super.key, required this.recipe});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.sp)
        ),
        margin: EdgeInsets.only(bottom: 30.h),
        padding: EdgeInsets.only(top: 15.h, left: 25.w, right: 25.w, bottom: 16.h ),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(recipe.imageUrl, height: 350.h, width: 350.w,),
            Row(
              children: [
                Image.asset('assets/icons/Like.png',height: 20.h, width: 20.w,),
                SizedBox(width: 5.w,),
                Text('1.5K', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800, letterSpacing: 0.5.sp)),
                SizedBox(width: 13.w,),
                Image.asset('assets/icons/comment.png',height: 20.h,width: 20.w,),
                SizedBox(width: 5.w,),
                Text('250', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800, letterSpacing: 0.5.sp)),
                SizedBox(width: 13.w,),
                Image.asset('assets/icons/share.png',height: 20.h,width: 20.w,),
                SizedBox(width: 5.w,),
                Text('25', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800, letterSpacing: 0.5.sp)),
                Spacer(flex: 1,),
                Image.asset('assets/icons/heart.png',height: 20.h,width: 20.w,),
                SizedBox(width: 5.w,),
                Text('150', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800, letterSpacing: 0.5.sp)),
              ],
            ),
            SizedBox(height: 4.h,),
            Text(recipe.name, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),),
            Text(recipe.details, style: TextStyle(fontSize: 12.sp),),
          ],
        )
    );
  }
}
