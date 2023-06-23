import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/features/user_managements/providers/providers.dart';


class ShoppingFrequencyCards extends ConsumerWidget {
  const ShoppingFrequencyCards({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexProvider = ref.watch(shoppingCardIndexProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                ref.read(shoppingCardIndexProvider.notifier).state = 0;
              },
              child: Container(
                height: 185.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: indexProvider == 0 ? Colors.yellow[50] : Color(0xffFEFBFF),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 25.h,),
                    Text('Once a Week\n', textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: /*indexProvider == 0 ? Colors.white :*/ Color(0xff575E71) ),),
                    Image.asset('assets/icons/register_page/sepet1.png', width: 95.w, height: 88.h,),
                  ],
                ),
              ),
            ),
            SizedBox(width: 30.w,),
            GestureDetector(
              onTap: (){
                ref.read(shoppingCardIndexProvider.notifier).state = 1;
              },
              child: Container(
                height: 185.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: indexProvider == 1 ? Colors.yellow[50] : Color(0xffFEFBFF),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 25.h,),
                    Text('More than Once a Week', textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: /*indexProvider == 1 ? Colors.white :*/ Color(0xff575E71) ),),
                    Image.asset('assets/icons/register_page/sepet2.png', width: 95.w, height: 88.h,),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 18.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                ref.read(shoppingCardIndexProvider.notifier).state = 2;
              },
              child: Container(
                height: 185.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: indexProvider == 2 ? Colors.yellow[50] : Color(0xffFEFBFF),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 25.h,),
                    Text('Once Each Two Weeks', textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: /*indexProvider == 0 ? Colors.white :*/ Color(0xff575E71) ),),
                    Image.asset('assets/icons/register_page/sepet3.png', width: 95.w, height: 88.h,),
                  ],
                ),
              ),
            ),
            SizedBox(width: 30.w,),
            GestureDetector(
              onTap: (){
                ref.read(shoppingCardIndexProvider.notifier).state = 3;
              },
              child: Container(
                height: 185.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: indexProvider == 3 ? Colors.yellow[50] : Color(0xffFEFBFF),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 25.h,),
                    Text('Once in a Month\n', textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: /*indexProvider == 1 ? Colors.white :*/ Color(0xff575E71) ),),
                    Image.asset('assets/icons/register_page/sepet4.png', width: 95.w, height: 88.h,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}