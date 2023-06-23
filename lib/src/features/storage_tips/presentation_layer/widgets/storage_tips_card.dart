import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/features/storage_tips/domain_layer/models/tip.dart';


class StorageTipCard extends StatelessWidget {

  final Tip tip ;
  const StorageTipCard({super.key, required this.tip});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 25.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.sp)
      ),
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tip.tipTitle, style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500, letterSpacing: 0.5.sp),),
          Text(tip.details, style: TextStyle(color: Color(0xff575E71), fontSize: 12.sp, fontWeight: FontWeight.w400, letterSpacing: 0.4.sp),),
        ],
      ),
    );
  }
}
