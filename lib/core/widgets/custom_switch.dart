import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manager.dart';

class CustomSwitch extends StatelessWidget {
  CustomSwitch({super.key, required this.iconImg1,required this.iconImg2,
    required this.currentValue, required this.values,
    required this.onChanged, required this.isTheme, this.icon1,
    this.icon2, this.iconsList});
  final bool isTheme;
   final IconData ?icon1;
  final IconData? icon2;
final String iconImg1;
final String iconImg2;
  final String currentValue;
  final List<String> values;
  final Function(String) onChanged;
  late List<Widget>? iconsList;
  @override
  Widget build(BuildContext context) {
    isTheme ?iconsList=[Icon(Icons.light_mode,color: ColorsManager.white,),Icon(Icons.dark_mode,color: ColorsManager.ofWhite,)]
    : iconsList=[Image.asset(iconImg1,height: 30,width: 30,),Image.asset(iconImg2,height: 30,width: 30,),];
    return SizedBox(height: 45.h,
    child:  AnimatedToggleSwitch<String>.rolling(
      current: currentValue,
      values: values,
      onChanged: onChanged,
      style: ToggleStyle(backgroundColor: Colors.transparent,  indicatorColor: ColorsManager.blue,
        borderColor: ColorsManager.blue,
        indicatorBorderRadius: BorderRadius.circular(20),),
      indicatorSize: Size(40.w, 40.h),
      spacing: 20,
      iconList: iconsList
    ),
    );
  }
}
