import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,this.controller ,this.validator,this.prefixIcon,
   this.labelText,this.hintText,this.maxLiens=1 ,required this.keyboardType,this.suffixIcon,this.isSecure=false});
final String ?labelText;
  final String ?hintText;
  final int ?maxLiens;
final Widget ?prefixIcon;
  final Widget? suffixIcon;
final TextInputType keyboardType;
final bool isSecure;
final String? Function(String?)? validator;
final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(maxLines: maxLiens,
      controller:controller,validator:validator,obscureText:isSecure,decoration: InputDecoration(
        labelText: labelText,
      prefixIcon:prefixIcon,
      suffixIcon:suffixIcon,
      hintText: hintText,

    ),
      keyboardType: keyboardType,);
  }
}
