import 'package:evently/core/constant_manager/prefs_constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager{
  static late SharedPreferences prefs;


  static Future<void> init() async{
     prefs= await SharedPreferences.getInstance();

 }
  static saveTheme(ThemeMode themeMode)  {
    String savedTheme=themeMode==ThemeMode.light?"Light":"Dark";
    prefs.setString(PrefsConstant.themeKey,savedTheme );

  }
  static ThemeMode? getSavedTheme(){
   String? savedTheme =  prefs.getString(PrefsConstant.themeKey);
    if(savedTheme == "Light"){
      return ThemeMode.light;
    }
    if(savedTheme== "Dark"){
      return ThemeMode.dark;
    }
    return null;

  }


  static saveLanguage(String lang){
   prefs.setString(PrefsConstant.languageKey, lang);
  }

  static String? getSavedLanguage(){
    String? savedLanguage = prefs.getString(PrefsConstant.languageKey);
    return savedLanguage;
  }



}