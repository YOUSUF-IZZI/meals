import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/features/refrigerator/providers/refrigerator_items_providers.dart';



class ExpandedItemsCategoryListView extends StatefulWidget {
  ExpandedItemsCategoryListView({Key? key}) : super(key: key);
  @override
  State<ExpandedItemsCategoryListView> createState() => _ExpandedItemsCategoryListViewState();
}
class _ExpandedItemsCategoryListViewState extends State<ExpandedItemsCategoryListView> {
  String? textFieldValue;
  TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) {
          // here pass the list provider you want
          final itemsProvider = ref.watch(itemsCategoryListProvider);
          return  Container(
            height: 50.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: itemsProvider.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 9.w),
                    alignment: Alignment.center,
                    height: 50.h,
                    decoration: BoxDecoration(color: ref.watch(itemsCategoryIndexProvider) == index ? Color(0xff575E71) : Color(0xffFAFDFF),
                        borderRadius: BorderRadius.circular(25.sp)),
                    child: Text(ref.watch(itemsCategoryListProvider)[index], style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5.sp,
                        color: ref.watch(itemsCategoryIndexProvider) == index ? Colors.white : Color(0xff575E71)),
                    ),
                  ),
                  onTap: () {
                    if (itemsProvider[index] == '+') {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Create new Category'),
                            content: TextField(
                              controller: myController,
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Add'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  setState(() {
                                    textFieldValue = myController.text;
                                    if (textFieldValue != null) {
                                      itemsProvider.insert(itemsProvider.length-1, textFieldValue!);
                                    }
                                    ref.read(itemsCategoryIndexProvider.notifier).state = index;
                                    ref.read(itemsCategorySelectorProvider.notifier).state = ref.watch(itemsCategoryListProvider)[index];
                                  });
                                },
                              )
                            ],
                          );
                        },
                      );
                    }
                    // The providers to hold the current index and the category name
                    ref.read(itemsCategoryIndexProvider.notifier).state = index;
                    ref.read(itemsCategorySelectorProvider.notifier).state = ref.watch(itemsCategoryListProvider)[index];
                  },
                );
              },
            ),
          );
        },
    );
  }
}