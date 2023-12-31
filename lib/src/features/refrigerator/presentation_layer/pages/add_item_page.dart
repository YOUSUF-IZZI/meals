import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:task_two/src/common/common_components/avatar_picker.dart';
import 'package:task_two/src/common/common_components/loge_bar_component.dart';
import 'package:task_two/src/common/common_widgets/custom_form_field_widget.dart';
import 'package:task_two/src/common/common_widgets/procced_button_widget.dart';
import 'package:task_two/src/common/providers/controllers.dart';
import 'package:task_two/src/features/refrigerator/application_layer/refrigerator_items_service.dart';
import 'package:task_two/src/features/refrigerator/presentation_layer/components/expanded_items_category_listview.dart';
import 'package:task_two/src/features/refrigerator/providers/refrigerator_items_providers.dart';


class AddItemPage extends ConsumerWidget {
  AddItemPage({super.key});

  final ItemService itemService = ItemService();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemFormGroup = ref.watch(itemFormGroupProvider);
    final categoryProvider = ref.watch(itemsCategorySelectorProvider);
    final itemImageFile = ref.watch(imageFileProvider);
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
            formGroup: itemFormGroup,
            child: Column(
              children: [
                LogoBar(),
                SizedBox(height: 9.17.h,),
                Text('Add New Item', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700), textAlign: TextAlign.center,),
                SizedBox(height: 4.h,),
                Text('Add item to your refrigerator', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
                SizedBox(height: 39.h,),
                ExpandedItemsCategoryListView(),
                SizedBox(height: 20.h,),
                Expanded(
                  child: SingleChildScrollView (
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        SizedBox(height: 5.h,),
                        Row(
                          children: [
                            AvatarPicker(bigAvatarRadius: 28, smallAvatarRadius: 9,),
                            SizedBox(width: 11.w,),
                            Expanded(child: CustomFormField(labeltText: ' Name', formControlName: 'name'))
                          ],
                        ),
                        SizedBox(height: 20.h,),
                        Row(
                          children: [
                            Expanded(child: CustomFormField(labeltText: ' Purchase Date', formControlName: 'purchaseDate')),
                            SizedBox(width: 10.w,),
                            Expanded(child: CustomFormField (labeltText: ' Expiration  Date', formControlName: 'expirationDate'))
                          ],
                        ),
                        SizedBox(height: 20.h,),
                        Row(
                          children: [
                            Expanded(child: CustomFormField(labeltText: ' Quantity', formControlName: 'quantity')),
                            SizedBox(width: 10.w,),
                            Expanded(child: CustomFormField (labeltText: ' Unit', formControlName: 'unit'))
                          ],
                        ),
                        SizedBox(height: 20.h,),
                        CustomFormField(labeltText: ' Market Name', formControlName: 'marketName'),
                        SizedBox(height: 20.h,),
                        CustomFormField(labeltText: ' notes ..', formControlName: 'notes', maxLines: 5,),
                        SizedBox(height: 20.h,),
                        ProccedButton(
                          buttonName: 'Procced',
                          onPressed: () async {
                            itemService.uploadDataToFirebase(itemFormGroup, categoryProvider, itemImageFile);
                            context.pop();
                          },
                        ),
                        SizedBox(height: 200.h,),
                      ],
                    ),
                  ),
                ),
                //SizedBox(height: 50.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

