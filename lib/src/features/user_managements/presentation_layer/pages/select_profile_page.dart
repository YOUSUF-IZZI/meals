import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task_two/src/common/common_components/avatar_picker.dart';
import 'package:task_two/src/common/common_widgets/procced_button_widget.dart';
import 'package:task_two/src/features/user_managements/presentation_layer/widgets/custom_rich_text.dart';



class SelectProfilePage extends ConsumerWidget {
  const SelectProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
          body: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.only(left: 35.w, right: 35.w, top: 24.h),
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
                    const PoweredNumbersText(pageNumber: '4'),
                    SizedBox(height: 4.h,),
                    //Linear Bar
                    SizedBox(height: 11.h,),
                    Text('Select Profile Picture', style: TextStyle(color: const Color(0xff001F29),fontSize: 24.sp, fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                    SizedBox(height: 13.h,),
                    Text('You can select photo from one of\npresetor add your own photo', style: TextStyle(color: const Color(0xff575E71), fontWeight: FontWeight.w500, fontSize: 12.sp), textAlign: TextAlign.center,),
                    SizedBox(height: 35.h,),
                    AvatarPicker(bigAvatarRadius: 75.sp, smallAvatarRadius: 15.sp, backgroundColor: Colors.white, backgroundImagePath: 'assets/icons/register_page/profile_avatar.png'),
                    SizedBox(height: 60.h,),
                    ProccedButton(
                        buttonName: 'Next',
                        onPressed: () {
                          context.go('/RegisterPage/VerificationPage/GenderPage/SelectProfilePage/ShoppingFrequencyPage');
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

