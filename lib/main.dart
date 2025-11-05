import 'package:evently/config/theme/theme_manager.dart';
import 'package:evently/core/routes_manager/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 841),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute:RoutesManager.router,
        initialRoute: RoutesManager.mainLayout,
        theme: ThemeManager.light,
        darkTheme:ThemeManager.dark ,
        locale: Locale("en"),
        localizationsDelegates: [AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          Locale('en'),
          Locale('ar'),
        ],
      ),

    );

  }
}
