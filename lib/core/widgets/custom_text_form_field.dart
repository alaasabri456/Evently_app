import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.prefixIcon,
  required this.labelText,required this.keyboardType,this.suffixIcon,this.isSecure=false});
final String labelText;
final Widget ?prefixIcon;
  final Widget? suffixIcon;
final TextInputType keyboardType;
final bool isSecure;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(obscureText:isSecure,decoration: InputDecoration(

      labelText: labelText,
      prefixIcon:prefixIcon,
      suffixIcon:suffixIcon,


    ),
      keyboardType: keyboardType,);
  }
}
