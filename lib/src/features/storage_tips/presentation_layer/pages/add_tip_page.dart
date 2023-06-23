import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:task_two/src/common/common_components/loge_bar_component.dart';
import 'package:task_two/src/common/common_widgets/custom_form_field_widget.dart';
import 'package:task_two/src/common/common_widgets/procced_button_widget.dart';
import 'package:task_two/src/features/storage_tips/application_layer/storage_tips_service.dart';
import 'package:task_two/src/features/storage_tips/presentation_layer/components/expanded_tips_category_listview.dart';
import 'package:task_two/src/features/storage_tips/providers/storage_tips_providers.dart';


class AddTipPage extends ConsumerWidget {
  AddTipPage({Key? key}) : super(key: key);
  StorageTipsService storageTipsService = StorageTipsService();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tipFormGroup = ref.watch(storageTipsFormGroupProvider);
    final categoryProvider = ref.watch(tipsCategorySelectorProvider);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 4.h),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ReactiveForm(
            formGroup: tipFormGroup,
            child: Column(
              children: [
                LogoBar(),
                SizedBox(height: 9.17.h,),
                Text('Add Tip', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700), textAlign: TextAlign.center,),
                SizedBox(height: 4.h,),
                Text('Add Storge Tips', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
                SizedBox(height: 39.h,),
                ExpandedTipsCategoryListView(),
                SizedBox(height: 20.h,),
                Expanded(
                  child: SingleChildScrollView (
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        CustomFormField(labeltText: '  Name', formControlName: 'tipTitle'),
                        SizedBox(height: 20.h,),
                        CustomFormField(labeltText: '  Details', formControlName: 'details', maxLines: 5,),
                        SizedBox(height: 20.h,),
                        ProccedButton(
                            onPressed: () async {
                              storageTipsService.createStorageTips(tipFormGroup, categoryProvider);
                              context.pop();
                            },
                            buttonName: 'Procced'
                        ),
                        SizedBox(height: 40.h,)
                      ],
                    ),
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}
