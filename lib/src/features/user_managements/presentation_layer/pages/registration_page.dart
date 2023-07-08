import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:task_two/src/common/common_widgets/custom_form_field_widget.dart';
import 'package:task_two/src/common/common_widgets/procced_button_widget.dart';
import 'package:task_two/src/features/user_managements/application_layer/user_services.dart';
import 'package:task_two/src/features/user_managements/presentation_layer/widgets/custom_rich_text.dart';
import 'package:task_two/src/features/user_managements/providers/providers.dart';


class RegisterPage extends ConsumerWidget {
  RegisterPage({Key? key}) : super(key: key);
  final UserServices userServices = UserServices();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formProvider = ref.watch(registerPageFormGroupProvider);
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
            child: ReactiveForm(
              formGroup: formProvider,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/Logo.png',height: 113.h,width: 178.w,),
                    SizedBox(height: 19.h,),
                    const PoweredNumbersText(pageNumber: '1'),
                    SizedBox(height: 4.h,),
                    // Add Linear Bar
                    SizedBox(height: 11.h,),
                    Text('Registration', style: TextStyle(color: const Color(0xff001F29),fontSize: 24.sp, fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                    SizedBox(height: 13.h,),
                    Text('Please enter your information,\nthen we will send OTP to verify', style: TextStyle(color: const Color(0xff575E71), fontWeight: FontWeight.w500, fontSize: 12.sp), textAlign: TextAlign.center,),
                    SizedBox(height: 40.h,),
                    CustomFormField(
                      labeltText: '   Name',
                      formControlName: 'name',
                    ),
                    SizedBox(height: 13.h,),
                    CustomFormField(
                      labeltText: '   Surname',
                      formControlName: 'surname',
                    ),
                    SizedBox(height: 13.h,),
                    CustomFormField(
                      labeltText: '   Email',
                      formControlName: 'email',
                    ),
                    SizedBox(height: 13.h,),
                    ProccedButton(
                        buttonName: 'Next',
                        onPressed: () async {
                          //context.go('/RegisterPage/VerificationPage');
                          userServices.movingFromRegistrationPage(formProvider, context);
                        }
                    ),
                    SizedBox(height: 13.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have account? ', style: TextStyle(color: Color(0xff575E71), fontFamily: 'Recoleta'),),
                        GestureDetector(
                          child: const Text('Login', style: TextStyle(color: Color(0xff715573), fontWeight: FontWeight.w800, fontFamily: 'Recoleta'),),
                          onTap: (){
                            context.go('/LoginPage');
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 300.h,)
                  ],
                ),
              ),
            )
          ),
        )
    );
  }
}
