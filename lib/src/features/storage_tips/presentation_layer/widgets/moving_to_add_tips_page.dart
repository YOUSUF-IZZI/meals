import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class MovingToAddTipsPage extends StatelessWidget {
  const MovingToAddTipsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0, bottom: 5.h,
      child: GestureDetector(
        onTap: (){
          context.go('/StorageTipsPage/AddTipPage');
        },
        child: CircleAvatar(
          radius: 30.sp,
          backgroundColor: Color(0xff0F1B32),
          child: Image(image: AssetImage('assets/icons/moving_to_add_tip_page.png',),height: 30.h, width: 30.w,),
        ),
      ),
    );
  }
}


