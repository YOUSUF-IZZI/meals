import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/features/storage_tips/providers/storage_tips_providers.dart';



class FixedTipsCategoryListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // here pass the list provider you want
    final listProvider = ref.watch(storageTipsCategoryListProvider);
    final indexProvider = ref.watch(tipsCategoryIndexProvider);
    return Container(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listProvider.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 9.w),
              alignment: Alignment.center,
              height: 50.h,
              decoration: BoxDecoration(
                  color: indexProvider == index ? Color(0xff575E71) : Color(0xffFAFDFF),
                  borderRadius: BorderRadius.circular(25.sp)),
              child: Text(
                listProvider[index] == '+'? 'All' : listProvider[index],
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, letterSpacing: 0.5.sp, color: indexProvider == index ? Colors.white : Color(0xff575E71)),
              ),
            ),
            onTap: () {
              ref.read(tipsCategoryIndexProvider.notifier).state = index;
              ref.read(tipsCategorySelectorProvider.notifier).state = listProvider[index];
            },
          );
        },
      ),
    );
  }
}