import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/features/refrigerator/domain_layer/models/item.dart';
import 'package:task_two/src/features/refrigerator/presentation_layer/widgets/item_card.dart';
import 'package:task_two/src/features/refrigerator/providers/refrigerator_items_providers.dart';


class ListOfItemCards extends StatelessWidget {
  const ListOfItemCards({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
          builder: (context, ref, child){
            final provider = ref.watch(getItemsDataProvider);
            return provider.when(
                data: (data) => ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ItemCard(item: Item(
                            name: data[index]['name'],
                            purchaseDate: data[index]['purchaseDate'],
                            expirationDate: data[index]['expirationDate'],
                            quantity: data[index]['quantity'],
                            unit: data[index]['unit'],
                            marketName: data[index]['marketName'],
                            notes: data[index]['notes'],
                            imageUrl: data[index]['imageUrl']),
                        ),
                        SizedBox(height: 23.h,)
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
