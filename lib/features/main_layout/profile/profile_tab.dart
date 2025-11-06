import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/routes_manager/routes_manager.dart';
import 'package:evently/core/widgets/custom_drop_down_item.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../providers/language_provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<ThemeProvider>(context);
    var languageProvider=Provider.of<LanguageProvider>(context);
    AppLocalizations appLocalizations=AppLocalizations.of(context)!;
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: REdgeInsets.all(16),
            width: double.infinity,

            decoration: BoxDecoration(
              color: ColorsManager.blue,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64.r))
            ),
            child: SafeArea(
              bottom: false,
              left: false,
              right: false,
              child: Row(
                children: [
                  Image.asset(ImageAssets.profile),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("John Safwat",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: ColorsManager.white),),
                      Text("johnsafwat.route@gmail.com",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: ColorsManager.white),),

                    ],),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h,),
          CustomDropDownItem(label: appLocalizations.theme,menuItems: [appLocalizations.light,appLocalizations.dark],
            selectedLabel:themeProvider.isDark?appLocalizations.dark:appLocalizations.light,
            onChange: (newTheme){
            themeProvider.changeAppTheme(newTheme==appLocalizations.light?ThemeMode.light:ThemeMode.dark);
          },),
          SizedBox(height: 16.h,),
          CustomDropDownItem(label: appLocalizations.language,menuItems: ["Arabic","English"],selectedLabel:languageProvider.isEnglish?"English":"Arabic" ,
          onChange:(newLanguage){
            languageProvider.changeAppLanguage(newLanguage=="English"?"en":"ar");
          },
          ),
        Spacer(flex: 7,),
        Container(margin: REdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(style:ElevatedButton.styleFrom(padding: REdgeInsets.symmetric(horizontal: 16,vertical: 16),
            backgroundColor:ColorsManager.red,
            foregroundColor: ColorsManager.white,textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),
          ),
              onPressed:_logout, child: Row(
            children: [
              Icon(Icons.logout,color: ColorsManager.white,),
              Text(appLocalizations.logout,)
            ],
          )),
        ),
          Spacer(flex: 3,)

        ],

    );

  }
  void _logout()async {
    await   FirebaseAuth.instance.signOut();

    Navigator.pushReplacementNamed(context, RoutesManager.login);
  }
}

