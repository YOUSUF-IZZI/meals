import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/features/user_managements/providers/providers.dart';


class AlertSetterComponent extends ConsumerWidget {
  const AlertSetterComponent({super.key,});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alertingProvider = ref.watch(alertProvider);
    return Container(
      height: 410.h,
      width: 362.w,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[

          Positioned(
            top: 60.h,
            child: CircleAvatar(
              radius: 175.sp,
              backgroundColor: Color(0x3037474F),
              child: Image.asset('assets/icons/register_page/calender.png'),
            ),
          ),

          Positioned(
            left: 0, top: 60.h,
              child: GestureDetector(
                onTap: (){
                  ref.read(alertProvider.notifier).state = 1;
                },
                child: Container(
                  height: 60.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                      color: alertingProvider == 1 ? Color(0xff715573) : Colors.white,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Center(child: Text('One Day', style: TextStyle(fontSize: 16.sp, color: alertingProvider == 1 ? Colors.white : Color(0xff575E71) ),)),
                ),
              ),
          ),

          Positioned(
            child: GestureDetector(
              onTap: (){
                ref.read(alertProvider.notifier).state = 7;
              },
              child: Container(
                height: 60.h,
                width: 130.w,
                decoration: BoxDecoration(
                    color: alertingProvider == 7 ? Color(0xff715573) : Colors.white,
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Center(child: Text('One Week', style: TextStyle(fontSize: 16.sp, color: alertingProvider == 7 ? Colors.white : Color(0xff575E71) ),)),
              ),
            ),
          ),

          Positioned(
            right: 0, top: 60.h,
            child: GestureDetector(
              onTap: (){
                ref.read(alertProvider.notifier).state = 30;
              },
              child: Container(
                height: 60.h,
                width: 130.w,
                decoration: BoxDecoration(
                    color: alertingProvider == 30 ? Color(0xff715573) : Colors.white,
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Center(child: Text('One Month', style: TextStyle(fontSize: 16.sp, color: alertingProvider == 30 ? Colors.white : Color(0xff575E71) ),)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}