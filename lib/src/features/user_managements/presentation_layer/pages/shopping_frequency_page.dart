import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task_two/src/common/common_widgets/procced_button_widget.dart';
import 'package:task_two/src/features/user_managements/presentation_layer/widgets/custom_rich_text.dart';
import 'package:task_two/src/features/user_managements/presentation_layer/widgets/shopping_frequency_card.dart';


class ShoppingFrequencyPage extends StatelessWidget {
  const ShoppingFrequencyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 24.h),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_image.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/Logo.png',height: 113.h,width: 178.w,),
                    SizedBox(height: 19.h,),
                    const PoweredNumbersText(pageNumber: '5'),
                    SizedBox(height: 4.h,),
                    //Linear Bar
                    SizedBox(height: 11.h,),
                    Text('Shopping Frequency', style: TextStyle(color: const Color(0xff001F29),fontSize: 24.sp, fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                    SizedBox(height: 13.h,),
                    Text('How many time you go shopping', style: TextStyle(color: const Color(0xff575E71), fontWeight: FontWeight.w500, fontSize: 12.sp), textAlign: TextAlign.center,),
                    SizedBox(height: 35.h,),
                    ShoppingFrequencyCards(),
                    SizedBox(height: 25.h,),
                    ProccedButton(
                        buttonName: 'Next',
                        onPressed: () {
                          context.go('/RegisterPage/VerificationPage/GenderPage/SelectProfilePage/ShoppingFrequencyPage/AlertPage');
                        }
                    ),
                  ],
                ),
              )
          ),
        )
    );
  }
}