import 'package:evently/features/authenticatin/login/login.dart';
import 'package:evently/features/create_event/create_event.dart';
import 'package:evently/features/event_details/event_details.dart';
import 'package:evently/features/on_boarding/on_boarding_screen.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';

import '../../features/authenticatin/register/register.dart';
import '../../features/main_layout/main_layout.dart';
import '../../features/on_boarding/start_screen.dart';
import '../../features/splash/splash_screen.dart';

class RoutesManager{
  static const String register="/register";
  static const String login="/login";
  static const String mainLayout="/mainLayout";
  static const String createEvent="/createEvent";
  static const String eventDetails="/eventDetails";
  static const String onboarding="/onboarding";
  static const String startScreen="/startScreen";
  static const String splashScreen="/splashScreen";

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
    final EventModel? event = setting.arguments as EventModel?;
    return MaterialPageRoute(
    builder: (context) => CreateEvent(event: event),);
      }

      case eventDetails:{
        final EventModel event=setting.arguments as EventModel;
        return MaterialPageRoute(builder:(context) => EventDetails(event: event,),);
      }

      case onboarding:{
        return MaterialPageRoute(builder:(context) => OnBoardingScreen(),);
      }
      case startScreen:{
        return MaterialPageRoute(builder:(context) => StartScreen(),);
      }
      case splashScreen:{
        return MaterialPageRoute(builder:(context) => SplashScreen(),);
      }
    }
  }
}
