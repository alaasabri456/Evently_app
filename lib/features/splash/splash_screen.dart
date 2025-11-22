
import 'package:evently/core/resources/assets_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/routes_manager/routes_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(ImageAssets.logo))
          .animate(
        onComplete: (controlle) {
          FirebaseAuth.instance.currentUser == null?
          Navigator.pushReplacementNamed(context, RoutesManager.login):Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
          },)
          .slideX(duration: Duration(seconds: 1))
          .then()
          .scale(duration: Duration(seconds: 2),
          begin: Offset(0.5, 0.5)),
    );
  }
}