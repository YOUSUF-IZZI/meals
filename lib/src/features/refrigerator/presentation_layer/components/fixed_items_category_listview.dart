import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/features/refrigerator/providers/refrigerator_items_providers.dart';



class FixedItemsCategoryListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // here pass the list provider you want
    final categoryProvider = ref.watch(itemsCategoryListProvider);
    return Container(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryProvider.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 9.w),
              alignment: Alignment.center,
              height: 50.h,
              decoration: BoxDecoration(
                  color: ref.watch(itemsCategoryIndexProvider) == index ? Color(0xff575E71) : Color(0xffFAFDFF),
                  borderRadius: BorderRadius.circular(25.sp)),
              child: Text(
                categoryProvider[index] == '+'? 'All' : categoryProvider[index],
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, letterSpacing: 0.5.sp, color: ref.watch(itemsCategoryIndexProvider) == index ? Colors.white : Color(0xff575E71)),
              ),
            ),
            onTap: () {
              ref.read(itemsCategoryIndexProvider.notifier).state=index;
              ref.read(itemsCategorySelectorProvider.notifier).state= categoryProvider[index];
            },
          );
        },
      ),
    );
  }
}