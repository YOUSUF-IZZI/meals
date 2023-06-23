import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/common/providers/controllers.dart';


class AvatarPicker extends ConsumerWidget {

  final double bigAvatarRadius;
  final double smallAvatarRadius;
  final Color? backgroundColor;
  final String? backgroundImagePath;
  const AvatarPicker({super.key, required this.bigAvatarRadius, required this.smallAvatarRadius, this.backgroundColor, this.backgroundImagePath});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageProvider = ref.watch(imageFileProvider);
    return Stack(
      children: <Widget> [
        Positioned(
            child: CircleAvatar(
                radius: bigAvatarRadius.sp ,
                backgroundColor: backgroundColor,
                backgroundImage: imageProvider == null ? null : FileImage(imageProvider),
                child: (imageProvider == null) & (backgroundImagePath != null)  ?  Image.asset(backgroundImagePath!) : null ,
            )
        ),
        Positioned(
            right: 0, bottom: 0,
            child: CircleAvatar(
              radius: smallAvatarRadius.sp ,
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
