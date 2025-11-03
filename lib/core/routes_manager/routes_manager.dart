import 'package:evently/features/authenticatin/login/login.dart';
import 'package:evently/features/create_event/create_event.dart';
import 'package:flutter/material.dart';

import '../../features/authenticatin/register/register.dart';
import '../../features/main_layout/main_layout.dart';

class RoutesManager{
  static const String register="/register";
  static const String login="/login";
  static const String mainLayout="/mainLayout";
  static const String createEvent="/createEvent";
  static Route? router(RouteSettings setting){
    switch(setting.name){
      case register:{
        return MaterialPageRoute(builder:(context) => Register(),);
      }
      case login:{
        return MaterialPageRoute(builder:(context) => Login(),);
      }
      case mainLayout:{
        return MaterialPageRoute(builder:(context) => MainLayout(),);
      }
      case createEvent:{
        return MaterialPageRoute(builder:(context) => CreateEvent(),);
      }
    }
  }
}
