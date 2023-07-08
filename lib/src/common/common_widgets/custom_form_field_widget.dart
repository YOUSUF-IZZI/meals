import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({Key? key,required this.labeltText, required this.formControlName, this.maxLines = 1}) : super(key: key);

  final String formControlName;
  final String labeltText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      maxLines: maxLines,
      formControlName: formControlName,
      decoration: InputDecoration(
        labelText: labeltText,
        labelStyle: const TextStyle(
          color: Color(0xff1B1B1F),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(15.sp))),
        filled: true,
        fillColor: const Color(0xffFEFBFF),
      ),
    );
  }
}
