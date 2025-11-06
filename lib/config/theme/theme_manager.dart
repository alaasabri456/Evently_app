
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/colors_manager.dart' ;

class ThemeManager{

  static final ThemeData light=ThemeData(useMaterial3: false,
    iconTheme: IconThemeData(
        color: ColorsManager.black
    ),
    cardTheme: CardThemeData(
        color: ColorsManager.whiteBlue,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),

        )
    ),
    primaryColor: ColorsManager.blue,
    scaffoldBackgroundColor: ColorsManager.whiteBlue,
   appBarTheme: AppBarTheme(backgroundColor: ColorsManager.whiteBlue,
     foregroundColor: ColorsManager.blue,
     centerTitle: true,
     titleTextStyle: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w400,color: ColorsManager.blue),
   ),
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
      bodySmall: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,color: ColorsManager.black),
      bodyLarge: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold,color:ColorsManager.white),
        labelLarge:  TextStyle(color: ColorsManager.black,fontSize:20.sp ,fontWeight: FontWeight.w700,),
        labelSmall: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color:ColorsManager.white),
      labelMedium: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500,color:ColorsManager.white),
        titleMedium:TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: ColorsManager.blue),
      titleSmall:TextStyle(fontSize: 14.sp, color: ColorsManager.black, fontWeight: FontWeight.bold,),

    ),
floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: ColorsManager.blue,  foregroundColor: ColorsManager.white,
  shape: StadiumBorder(
    side: BorderSide(color: ColorsManager.white,width: 4)),),
bottomNavigationBarTheme: BottomNavigationBarThemeData( elevation: 0,
  selectedItemColor: ColorsManager.white,
  unselectedItemColor: ColorsManager.white,
  backgroundColor:Colors.transparent,type: BottomNavigationBarType.fixed,),
   bottomAppBarTheme: BottomAppBarThemeData(color:ColorsManager.blue,shape: CircularNotchedRectangle(),elevation: 16, ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            padding: REdgeInsets.symmetric(vertical: 16),
            side: BorderSide(color: ColorsManager.blue, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            )
        )
    ),
   // dividerTheme: DividerThemeData(color: ColorsManager.blue,thickness: 1,endIndent: 16.w,indent: 42.w )
  );






  static final ThemeData dark=ThemeData(useMaterial3: false,
      primaryColor: ColorsManager.darkBlue,
    scaffoldBackgroundColor: ColorsManager.darkBlue,
      cardTheme: CardThemeData(
          color: ColorsManager.darkBlue,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),

          )
      ),
      iconTheme: IconThemeData(
        color: ColorsManager.ofWhite),
      appBarTheme: AppBarTheme(backgroundColor: ColorsManager.darkBlue,
        foregroundColor: ColorsManager.blue,
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w400,color: ColorsManager.blue),
      ),
      inputDecorationTheme: InputDecorationTheme( focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorsManager.gray,width: 1.w),
          borderRadius: BorderRadius.circular(16.r)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorsManager.blue,width: 1.w),
            borderRadius: BorderRadius.circular(16.r)),
        errorBorder:  OutlineInputBorder(borderSide: BorderSide(color: ColorsManager.red,width: 1.w),
            borderRadius: BorderRadius.circular(16.r)),
        focusedErrorBorder:  OutlineInputBorder(borderSide: BorderSide(color: ColorsManager.red,width: 1.w),
            borderRadius: BorderRadius.circular(16.r)),
        hintStyle: TextStyle(fontSize: 16.sp,color: ColorsManager.ofWhite,fontWeight: FontWeight.w500),
        labelStyle:TextStyle(fontSize: 16.sp,color: ColorsManager.ofWhite,fontWeight: FontWeight.w500),

        prefixIconColor: ColorsManager.ofWhite,
        suffixIconColor: ColorsManager.ofWhite ,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(padding: REdgeInsets.all(16),
            shape: RoundedRectangleBorder(borderRadius:BorderRadiusGeometry.circular(16.r) ),
            backgroundColor:ColorsManager.blue,
            foregroundColor: ColorsManager.white,
            textStyle: TextStyle(fontSize:20.sp ,fontWeight: FontWeight.w500,)
        ),),
      textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,color: ColorsManager.ofWhite),
        labelLarge:  TextStyle(color: ColorsManager.ofWhite,fontSize:20.sp ,fontWeight: FontWeight.w700,),
         bodyLarge: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold,color:ColorsManager.ofWhite),
        labelSmall: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color:ColorsManager.ofWhite),
        labelMedium: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500,color:ColorsManager.ofWhite),
        titleMedium:TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: ColorsManager.blackDark),
        titleSmall:TextStyle(fontSize: 14.sp, color: ColorsManager.ofWhite, fontWeight: FontWeight.bold,),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: ColorsManager.darkBlue,  foregroundColor: ColorsManager.ofWhite,
        shape: StadiumBorder(
            side: BorderSide(color: ColorsManager.ofWhite,width: 4)),),
      bottomNavigationBarTheme: BottomNavigationBarThemeData( elevation: 0,
        selectedItemColor: ColorsManager.ofWhite,
        unselectedItemColor: ColorsManager.ofWhite,
        backgroundColor:Colors.transparent,type: BottomNavigationBarType.fixed,),
      bottomAppBarTheme: BottomAppBarThemeData(color:ColorsManager.darkBlue,shape: CircularNotchedRectangle(),elevation: 16, ),

    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            padding: REdgeInsets.symmetric(vertical: 16),
            side: BorderSide(color: ColorsManager.blue, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            )
        )
    ),


  );


}