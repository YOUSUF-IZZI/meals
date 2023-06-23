import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({Key? key,required this.labeltText, required this.formControlName, this.maxLines}) : super(key: key);

  String formControlName;
  String labeltText;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      maxLines: maxLines == null ? 1: maxLines,
        formControlName: formControlName,
        decoration: InputDecoration(
          labelText: labeltText,
          labelStyle: TextStyle(
            color: Color(0xff1B1B1F),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(15.sp))),
          filled: true,
          fillColor: Color(0xffFEFBFF),
        ),
    );
  }
}
