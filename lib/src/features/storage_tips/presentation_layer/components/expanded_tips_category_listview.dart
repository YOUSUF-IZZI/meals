import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/features/storage_tips/providers/storage_tips_providers.dart';



class ExpandedTipsCategoryListView extends StatefulWidget {
  ExpandedTipsCategoryListView({Key? key}) : super(key: key);
  @override
  State<ExpandedTipsCategoryListView> createState() => _ExpandedTipsCategoryListViewState();
}
class _ExpandedTipsCategoryListViewState extends State<ExpandedTipsCategoryListView> {
  String? textFieldValue;
  TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) {
          final listProvider = ref.watch(storageTipsCategoryListProvider);
          return  Container(
            height: 50.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listProvider.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 9.w),
                    alignment: Alignment.center,
                    height: 50.h,
                    decoration: BoxDecoration(color: ref.watch(tipsCategoryIndexProvider) == index ? Color(0xff575E71) : Color(0xffFAFDFF),
                        borderRadius: BorderRadius.circular(25.sp)),
                    child: Text(ref.watch(storageTipsCategoryListProvider)[index], style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5.sp,
                        color: ref.watch(tipsCategoryIndexProvider) == index ? Colors.white : Color(0xff575E71)),
                    ),
                  ),
                  onTap: () {
                    if (listProvider[index] == '+') {
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
                                      listProvider.insert(listProvider.length-1, textFieldValue!);
                                    }
                                    ref.read(tipsCategoryIndexProvider.notifier).state = index;
                                    ref.read(tipsCategorySelectorProvider.notifier).state = listProvider[index];
                                  });
                                },
                              )
                            ],
                          );
                        },
                      );
                    }
                    // The providers to hold the current index and the category name
                    ref.read(tipsCategoryIndexProvider.notifier).state = index;
                    ref.read(tipsCategorySelectorProvider.notifier).state = listProvider[index];
                  },
                );
              },
            ),
          );
        },
    );
  }
}