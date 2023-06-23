import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProccedButton extends StatelessWidget {
  ProccedButton({Key? key, required this.buttonName, this.onPressed}) : super(key: key);
  String buttonName;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff141B2C),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.sp)
            )
        ),
        child: Text(buttonName, style: TextStyle(fontSize: 16.sp,color: Colors.white,fontFamily: 'Recoleta', fontWeight: FontWeight.w500),),
        onPressed: onPressed,
      ),
    );
  }
}
