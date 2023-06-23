import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:task_two/src/common/common_widgets/procced_button_widget.dart';
import 'package:task_two/src/features/user_managements/application_layer/user_services.dart';
import 'package:task_two/src/features/user_managements/presentation_layer/components/alert_setter.dart';
import 'package:task_two/src/features/user_managements/presentation_layer/widgets/custom_rich_text.dart';
import 'package:task_two/src/features/user_managements/providers/providers.dart';


class AlertPage extends ConsumerWidget {
  AlertPage({Key? key}) : super(key: key);
  final UserServices services = UserServices();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formProvider = ref.watch(registerPageFormGroupProvider);
    return SafeArea(
        child: Scaffold(
          body: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 24.h),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_image.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: ReactiveForm(
                  formGroup: formProvider,
                  child: Column(
                    children: [
                      Image.asset('assets/images/Logo.png',height: 113.h,width: 178.w,),
                      SizedBox(height: 19.h,),
                      const PoweredNumbersText(pageNumber: '6'),
                      SizedBox(height: 4.h,),
                      //Linear Bar
                      SizedBox(height: 11.h,),
                      Text('How many days before the\nexpiration date should we alert you', style: TextStyle(color: const Color(0xff001F29),fontSize: 22.sp, fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                      SizedBox(height: 25.h,),
                      const AlertSetterComponent(),
                      SizedBox(height: 30.h,),
                      ProccedButton(
                          buttonName: 'Procced',
                          onPressed: () async {
                            await services.register(formProvider, context);
                            //context.go('/RegisterPage/VerificationPage/GenderPage/SelectProfilePage/ShoppingFrequency');
                          }
                      ),
                      SizedBox(height: 90.h,)
                    ],
                  ),
                ),
              )
          ),
        )
    );
  }
}