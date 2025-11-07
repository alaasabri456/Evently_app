import 'package:evently/config/theme/theme_manager.dart';
import 'package:evently/core/prefs_manager/prefs_manager.dart';
import 'package:evently/core/routes_manager/routes_manager.dart';
import 'package:evently/firebase/firebase_service.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await PrefsManager.init();
  await Firebase.initializeApp();
 if(FirebaseAuth.instance.currentUser!=null){
   UserModel.currentUser=await FirebaseService.getUserFromFireStore(FirebaseAuth.instance.currentUser!.uid);
 }


  runApp(
   MultiProvider(providers: [ChangeNotifierProvider(create:(context) =>ThemeProvider()),ChangeNotifierProvider(create:(context) =>LanguageProvider())],
   child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<ThemeProvider>(context);
    var languageProvider=Provider.of<LanguageProvider>(context);
    return ScreenUtilInit(
      designSize: Size(393, 841),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute:RoutesManager.router,
        initialRoute: FirebaseAuth.instance.currentUser==null?RoutesManager.login:RoutesManager.mainLayout,
        //initialRoute: RoutesManager.login,
        theme: ThemeManager.light,
        darkTheme:ThemeManager.dark ,
        themeMode: themeProvider.currentTheme,
        locale: Locale(languageProvider.currentLanguage),
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
