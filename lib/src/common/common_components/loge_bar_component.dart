import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoBar extends StatelessWidget {
  const LogoBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('logo', style: TextStyle(fontSize: 59.33.sp, fontFamily: 'Ibarra Real Nova'),),
        Spacer(flex: 1,),
        Container(
          width: 40.63.w,
          height: 45.31.h,
          child: Image.asset('assets/icons/Vector.png'),
        )
      ],
    );
  }
}