import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/features/refrigerator/domain_layer/models/item.dart';


class ItemCard extends StatelessWidget {
  final Item item;
  DateTime? purchaseDate ;
  DateTime? expirationDate;
  Duration? difference ;
  int? remainingDaysBeforExpiration;
  String? dayOrDays;

  ItemCard({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    purchaseDate = DateTime.parse(item.purchaseDate);
    expirationDate = DateTime.parse(item.expirationDate);
    difference = expirationDate?.difference(purchaseDate!);
    remainingDaysBeforExpiration = difference?.inDays;

    if (remainingDaysBeforExpiration! > 1) {
      dayOrDays = 'Days';
    } else dayOrDays = 'Day';

    return Container(
      padding: EdgeInsets.only(left: 10.w, top: 6.h, bottom: 6.h, right: 25.w  ),
      height: 78.h,
      decoration: BoxDecoration(
          color: Color(0xffFEFBFF),
          borderRadius: BorderRadius.circular(15.sp)
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.sp,
            backgroundImage: NetworkImage(item.imageUrl),
          ),
          SizedBox(width: 25.h,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(item.name, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w400, letterSpacing: 0.5.sp),),
              Row(
                children: [
                  Text('$remainingDaysBeforExpiration $dayOrDays', style: TextStyle(
                      color: remainingDaysBeforExpiration! < 3 ? Colors.red : Color(0xff715573),
                      fontSize: 22.sp, fontWeight: FontWeight.w400, letterSpacing: 0.5.sp)),
                  SizedBox(width: 47.w,),
                  Text('${item.quantity} ${item.unit}', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w400, letterSpacing: 0.5.sp)),
                ],
              )
            ],
          ),
          Spacer(flex: 1,),
          Column(
            children: [
              Image.asset('assets/icons/edit.png', height: 30.h, width: 30.w,),
              SizedBox(height: 5.h,),
              Image.asset('assets/icons/deleting_icon.png', height: 30.h, width: 30.w,)
            ],
          )
        ],
      ),
    );
  }
}
