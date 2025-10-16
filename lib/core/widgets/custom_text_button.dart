import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key,required this.text,required this.onTap});
final String text;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap:onTap,child: Text(text,style: TextStyle(fontStyle:FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 16.sp,color: ColorsManager.blue,decoration: TextDecoration.underline,)));
  }
}
