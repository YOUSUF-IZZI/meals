import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PoweredNumbersText extends StatelessWidget {

  final String pageNumber;
  const PoweredNumbersText({super.key, required this.pageNumber});
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: pageNumber, style: TextStyle(fontSize: 24.sp, color: Colors.black, fontFamily: 'Recoleta')),
          WidgetSpan(
            child: Transform.translate(
              offset: const Offset(0.0, -5.0),
              child: Text('/6', textScaleFactor: 0.7, style: TextStyle(fontSize: 24.sp, fontFamily: 'Recoleta'),),
            ),
          ),
        ],
      ),
    );
  }
}
