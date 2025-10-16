
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/colors_manager.dart' ;

class ThemeManager{
  static final ThemeData light=ThemeData(scaffoldBackgroundColor: ColorsManager.whiteBlue,
   inputDecorationTheme: InputDecorationTheme( focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorsManager.gray,width: 1.w),
      borderRadius: BorderRadius.circular(16.r)),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorsManager.blue,width: 1.w),
  borderRadius: BorderRadius.circular(16.r)),
  errorBorder:  OutlineInputBorder(borderSide: BorderSide(color: ColorsManager.red,width: 1.w),
  borderRadius: BorderRadius.circular(16.r)),
  focusedErrorBorder:  OutlineInputBorder(borderSide: BorderSide(color: ColorsManager.red,width: 1.w),
  borderRadius: BorderRadius.circular(16.r)),
     labelStyle:TextStyle(fontSize: 16.sp,color: ColorsManager.gray,fontWeight: FontWeight.w500),
     prefixIconColor: ColorsManager.gray ,
     suffixIconColor: ColorsManager.gray  ,
   ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(padding: REdgeInsets.all(16),
            shape: RoundedRectangleBorder(borderRadius:BorderRadiusGeometry.circular(16.r) ),
            backgroundColor:ColorsManager.blue,
          foregroundColor: ColorsManager.white,
          textStyle: TextStyle(fontSize:20.sp ,fontWeight: FontWeight.w500,)
        ),),
    textTheme: TextTheme(
      bodySmall: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,color: ColorsManager.black)
    ),
  );
  static final ThemeData dark=ThemeData();


}