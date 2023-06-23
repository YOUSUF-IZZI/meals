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
import 'package:task_two/src/features/recipes/application_layer/recipes_service.dart';
import 'package:task_two/src/features/recipes/presentation_layer/components/expanded_recipes_category_listview.dart';
import 'package:task_two/src/features/recipes/providers/recipes_providers.dart';



class AddRecipePage extends ConsumerWidget {
  RecipeService recipeService = RecipeService();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeFormGroup = ref.watch(recipeFormGroupProvider);
    final categoryProvider = ref.watch(recipesCategorySelectorProvider);
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
            formGroup: recipeFormGroup,
            child: Column(
              children: [
                LogoBar(),
                SizedBox(height: 9.17.h,),
                Text('Add New Item', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700), textAlign: TextAlign.center,),
                SizedBox(height: 4.h,),
                Text('Add recipe', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
                SizedBox(height: 39.h,),
                ExpandedRecipesCategoryListView(),
                SizedBox(height: 10.h,),
                Expanded(
                  child: SingleChildScrollView (
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        SizedBox(height: 5.h,),
                        AvatarPicker(bigAvatarRadius: 125, smallAvatarRadius: 25),
                        SizedBox(height: 10.h,),
                        CustomFormField(labeltText: ' Name', formControlName: 'name'),
                        SizedBox(height: 10.h,),
                        CustomFormField(labeltText: ' details', formControlName: 'details', maxLines: 2,),
                        SizedBox(height: 70.h,),
                        ProccedButton(
                          buttonName: 'Procced',
                          onPressed: () async {
                            recipeService.uploadDataToFirebase(recipeFormGroup, categoryProvider, itemImageFile);
                            context.pop();
                          },
                        ),
                        SizedBox(height: 50.h,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

