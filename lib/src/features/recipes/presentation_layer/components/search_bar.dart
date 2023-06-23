import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container (
            height: 56.h,
            decoration: BoxDecoration(
                color: Color(0xffFEFBFF),
                borderRadius: BorderRadius.circular(15.sp)
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: Image.asset('assets/icons/search.png'),
                fillColor: Color(0xffFEFBFF),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 16.w,right: 14.w, top: 15.h,bottom: 16.h),
              ),
            ),
          ),
        ),
        SizedBox(width: 11.w,),
        Image.asset('assets/icons/filter.png'),
      ],
    );
  }
}