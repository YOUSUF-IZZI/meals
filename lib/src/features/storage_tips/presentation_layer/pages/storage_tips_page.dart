import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/common/common_components/loge_bar_component.dart';
import 'package:task_two/src/features/storage_tips/presentation_layer/components/fixed_tips_category_listview.dart';
import 'package:task_two/src/features/storage_tips/presentation_layer/components/list_of_tip_cards.dart';
import 'package:task_two/src/features/storage_tips/presentation_layer/widgets/moving_to_add_tips_page.dart';
import '../widgets/custom_search_bar.dart';


class StorageTipsPage extends StatelessWidget {
  StorageTipsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 4.h),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  LogoBar(),
                  SizedBox(height: 9.17.h,),
                  Text('Storage Tips', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700), textAlign: TextAlign.center,),
                  SizedBox(height: 4.h,),
                  Text('List of Storage Tips', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
                  SizedBox(height: 28.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: const CustomSearchBar(),
                  ),
                  SizedBox(height: 17.h,),
                  FixedTipsCategoryListView(),
                  SizedBox(height: 20.h,),
                  const ListOfTipCardsList(),
                ],
              ),
              const MovingToAddTipsPage(),
            ],
          )
        ),
      ),
    );
  }
}
