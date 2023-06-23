import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_two/src/features/storage_tips/domain_layer/models/tip.dart';
import 'package:task_two/src/features/storage_tips/presentation_layer/widgets/storage_tips_card.dart';
import 'package:task_two/src/features/storage_tips/providers/storage_tips_providers.dart';


class ListOfTipCardsList extends StatelessWidget {
  const ListOfTipCardsList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
          builder: (context, ref, child){
            final provider = ref.watch(getStorageTipsDataProvider);
            return provider.when(
                data: (data) => ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        StorageTipCard(tip: Tip(tipTitle: data[index]['tipTitle'].toString(), details: data[index]['details'].toString())),
                        SizedBox(height: 17,)
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
