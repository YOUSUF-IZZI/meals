import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/features/recipes/domain_layer/models/recipe.dart';
import 'package:task_two/src/features/recipes/presentation_layer/components/recipe_card.dart';
import 'package:task_two/src/features/recipes/providers/recipes_providers.dart';


class ListOfRecipeCards extends StatelessWidget {
  const ListOfRecipeCards({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
          builder: (context, ref, child){
            final provider = ref.watch(getRecipesDataProvider);
            return provider.when(
                data: (data) => ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RecipeCard(recipe: Recipe(
                            name: data[index]['name'],
                            details: data[index]['details'],
                            imageUrl: data[index]['imageUrl']),
                        ),
                        SizedBox(height: 6.h,)
                      ],
                    )
                ),
                error: (error,stack)=> Text('error'),
                loading: ()=> CircularProgressIndicator());
          }
      ),
    );
  }
}
