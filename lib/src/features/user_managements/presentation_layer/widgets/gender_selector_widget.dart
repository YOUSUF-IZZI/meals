import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/features/user_managements/providers/providers.dart';


class GenderSelectorWidget extends ConsumerWidget {
  const GenderSelectorWidget({super.key,});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genderProvider = ref.watch(genderTypeProvider);
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            ref.read(genderTypeProvider.notifier).state = 'male';
          },
          child: Container(
            height: 350.h,
            width: 140.w,
            decoration: BoxDecoration(
              color: genderProvider == 'male' ? Color(0xff76517B) : Color(0xffFEFBFF),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                SizedBox(height: 13.h,),
                Text('Male', style: TextStyle(fontSize: 22.sp, color: genderProvider == 'male' ? Colors.white : Color(0xff575E71),),),
                Image.asset('assets/icons/register_page/male.png', width: 80.w, height: 300.h,),
              ],
            ),
          ),
        ),
        SizedBox(width: 25.w,),
        GestureDetector(
          onTap: (){
            ref.read(genderTypeProvider.notifier).state = 'female';
          },
          child: Container(
            height: 350.h,
            width: 140.w,
            decoration: BoxDecoration(
              color: genderProvider == 'female' ? Color(0xff76517B) : Color(0xffFEFBFF),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                SizedBox(height: 13.h,),
                Text('Female', style: TextStyle(fontSize: 22.sp, color: genderProvider == 'female' ? Colors.white : Color(0xff575E71),),),
                Image.asset('assets/icons/register_page/female.png', width: 100.w, height: 300.h,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}