import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/core/widgets/custom_switch.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/routes_manager/routes_manager.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/theme_provider.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  String selectedLanguage = "en";
  String selectedTheme = "light";
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider=Provider.of<LanguageProvider>(context);
      selectedTheme =themeProvider.isDark? "dark": "light";
    selectedLanguage =languageProvider.currentLanguage;
   AppLocalizations appLocalizations=AppLocalizations.of(context)!;

    return Scaffold(
      body: Padding(
          padding:  REdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    ImageAssets.onboardingLogo,
                    height: 50,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(height: 28.h),
              Image.asset(themeProvider.isDark?ImageAssets.startDark:
              ImageAssets.onboarding1),
                SizedBox(height: 28.h),
                Text("Personalize Your Experience",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: ColorsManager.blue),),
            SizedBox(height: 28.h,),

               Text(
                "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                style: Theme.of(context).textTheme.bodySmall,
              ),

            SizedBox(height: 28.h,),
            Row(children: [
              Text(appLocalizations.language,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500,color: ColorsManager.blue),),
              Spacer(),
              CustomSwitch(isTheme:false,iconImg1: ImageAssets.english, iconImg2: ImageAssets.arabic, currentValue: selectedLanguage, values: ["en", "ar"], onChanged: (value){
                selectedLanguage=value;
                setState(() {

                });
                languageProvider.changeAppLanguage(selectedLanguage);
              })
            ],),
                SizedBox(height: 16.h,),
                Row(children: [
                  Text(appLocalizations.theme,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500,color: ColorsManager.blue),),
                  Spacer(),
                  CustomSwitch(isTheme:true,iconImg1:"" , iconImg2: "", currentValue:selectedTheme, values: ["light", "dark"], onChanged: (value){
                    selectedTheme=value;
                    setState(() {

                    });
                    themeProvider.changeAppTheme(selectedTheme=="light"?ThemeMode.light:ThemeMode.dark);
                  })
                ],),
                SizedBox(height: 28.h,),
                CustomElevatedButton(onPressed:(){Navigator.pushReplacementNamed(context, RoutesManager.onboarding);}, text: "Let's Start")



              ],
            ),
          ),


      ),
    );
  }
}
