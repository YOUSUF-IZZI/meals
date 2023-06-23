import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/common/common_components/loge_bar_component.dart';
import 'package:task_two/src/features/refrigerator/presentation_layer/components/fixed_items_category_listview.dart';
import 'package:task_two/src/features/refrigerator/presentation_layer/components/list_of_item_cards.dart';
import 'package:task_two/src/features/refrigerator/presentation_layer/widgets/custom_search_bar.dart';


class MyRefridgeratorPage extends StatelessWidget {
  const MyRefridgeratorPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 4.h, right: 10.w, left: 10.w),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const LogoBar(),
              SizedBox(height: 9.17.h,),
              Text('My Refrigerator', textAlign: TextAlign.center, style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),),
              SizedBox(height: 4.h,),
              Text('List of items in my refrigerator', textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, letterSpacing: 0.5.sp)),
              SizedBox(height: 28.h ,),
              const CustomSearchBar(),
              SizedBox(height: 17.h,),
              FixedItemsCategoryListView(),
              SizedBox(height: 17.h,),
              const ListOfItemCards(),
            ],
          ),
        ),
      ),
    );
  }
}

