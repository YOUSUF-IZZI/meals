import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/common/common_components/loge_bar_component.dart';
import 'package:task_two/src/features/recipes/presentation_layer/components/fixed_recipes_category_listview.dart';
import 'package:task_two/src/features/recipes/presentation_layer/components/list_of_recipe_cards.dart';
import 'package:task_two/src/features/recipes/presentation_layer/widgets/moving_to_add_recipe_page.dart';
import 'package:task_two/src/features/recipes/presentation_layer/widgets/search_bar.dart';


class RecipesPage extends StatelessWidget {
  const RecipesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 4.h, right: 10.w, left: 10.w),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  const LogoBar(),
                  SizedBox(height: 9.17.h,),
                  Text('Recipes', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
                  SizedBox(height: 4.h,),
                  Text('List of Shared Recipes', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, letterSpacing: 0.5.sp), textAlign: TextAlign.center),
                  SizedBox(height: 28.h ,),
                  const CustomSearchBar(),
                  SizedBox(height: 17.h,),
                  FixedRecipesCategoryListView(),
                  SizedBox(height: 17.h,),
                  const ListOfRecipeCards(),
                ],
              ),
              const MovingToAddRecipePage()
            ],
          )
        ),
      ),
    );
  }
}



