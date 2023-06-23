import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/common/providers/controllers.dart';


/*
class ItemAvatar extends ConsumerWidget {
  const ItemAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageProvider = ref.watch(imageFileProvider);
    return Stack(
      children: <Widget> [
        Positioned(
            child: CircleAvatar(
              radius: 28.sp ,
              backgroundImage: imageProvider == null? null : FileImage(imageProvider), 
            )
        ),
        Positioned(
            right: 0, bottom: 0,
            child: CircleAvatar(
              radius: 9.sp ,
              backgroundColor: Color(0xff575E71),
              child: GestureDetector(
                onTap: (){
                  ref.read(imageFileProvider.notifier).pickImage();
                },
                child: Icon(Icons.add,color: Colors.white, size: 18.sp,),
              ),
            )
        ),
      ],
    );
  }
}
*/
