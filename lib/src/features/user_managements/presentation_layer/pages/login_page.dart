import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:task_two/src/common/common_widgets/custom_form_field_widget.dart';
import 'package:task_two/src/common/common_widgets/procced_button_widget.dart';
import 'package:task_two/src/features/user_managements/application_layer/user_services.dart';
import 'package:task_two/src/features/user_managements/providers/providers.dart';


class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  final UserServices services = UserServices();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fromProvider = ref.watch(loginPageFormGroupProvider);
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
                formGroup: fromProvider,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset('assets/images/Logo.png',height: 113.h,width: 178.w,),
                      SizedBox(height: 58.h,),
                      Text('Login', style: TextStyle(color: Color(0xff001F29),fontSize: 24.sp, fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                      SizedBox(height: 17.h,),
                      Text('Please enter your email or phone number and password,\nyou can reset your password,\nwe will send you reset instruction to your email', style: TextStyle(color: Color(0xff575E71), fontWeight: FontWeight.w500, fontSize: 12.sp), textAlign: TextAlign.center,),
                      SizedBox(height: 62.h,),
                      CustomFormField(
                        labeltText: '   Email',
                        formControlName: 'email',
                      ),
                      SizedBox(height: 13.h,),
                      CustomFormField(
                        labeltText: '   Password',
                        formControlName: 'password',
                      ),
                      SizedBox(height: 13.h,),
                      ProccedButton(
                        buttonName: 'Login',
                        onPressed: ()async {
                          await services.login(fromProvider, context);
                        },
                      ),
                      SizedBox(height: 13.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Text('Reset Password', style: TextStyle(color: Color(0xffBA1A1A), fontWeight: FontWeight.w400, fontFamily: 'Recoleta'),),
                            onTap: () async {},
                          ),
                          Text(' or ', style: TextStyle(color: Color(0xff74777F)),),
                          GestureDetector(
                            child: Text('Create Account', style: TextStyle(color: Color(0xff005AC1), fontWeight: FontWeight.w400, fontFamily: 'Recoleta'),),
                            onTap: (){
                              context.go('/RegisterPage');
                            },
                          ),
                        ]
                      ),
                      SizedBox(height: 300.h,)
                    ]
                  ),
                ),
              )
          ),
        )
    );
  }
}
