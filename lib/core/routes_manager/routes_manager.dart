import 'package:evently/features/authenticatin/login/login.dart';
import 'package:flutter/material.dart';

import '../../features/authenticatin/register/register.dart';

class RoutesManager{
  static const String register="/register";
  static const String login="/login";
  static Route? router(RouteSettings setting){
    switch(setting.name){
      case register:{
        return MaterialPageRoute(builder:(context) => Register(),);
      }
      case login:{
        return MaterialPageRoute(builder:(context) => Login(),);
      }
    }
  }
}
