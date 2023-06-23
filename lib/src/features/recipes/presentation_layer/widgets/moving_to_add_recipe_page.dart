import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class MovingToAddRecipePage extends StatelessWidget {
  const MovingToAddRecipePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0, bottom: 5.h,
      child: GestureDetector(
        onTap: (){
          context.go('/RecipesPage/AddRecipePage');
        },
        child: CircleAvatar(
          radius: 30.sp,
          backgroundColor: Color(0xff0F1B32),
          child: Image(image: AssetImage('assets/icons/book.png',),height: 30.h, width: 30.w,),
        ),
      ),
    );
  }
}


