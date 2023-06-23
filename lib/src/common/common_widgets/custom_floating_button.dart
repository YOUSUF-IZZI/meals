import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key,});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 33.sp,
      backgroundColor: Color(0xffE7E8FE),
      child: FloatingActionButton(
        backgroundColor: Color(0xff575E71),
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 40.sp, color: Colors.white,),
        onPressed: (){
          context.go('/MyRefridgeratorPage/AddItemPage');
        },
      ),
    );
  }
}