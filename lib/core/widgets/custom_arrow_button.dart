import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomArrowButton extends StatelessWidget {
  final IconData icon;
  const CustomArrowButton({super.key,required this.icon});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: ColorsManager.blue,
            width: 2.w,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            color: ColorsManager.blue,
            size: 20,
          ),
        ),
      ),
    );
  }
}
