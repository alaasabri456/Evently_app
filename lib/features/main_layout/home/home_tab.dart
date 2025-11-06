import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/widgets/custom_tab_bar.dart';
import 'package:evently/core/widgets/custom_tab_item.dart';
import 'package:evently/core/widgets/event_item.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/language_provider.dart';
import '../../../providers/theme_provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex=0;
  late AppLocalizations appLocalizations;
  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<ThemeProvider>(context);
    var languageProvider=Provider.of<LanguageProvider>(context);
    appLocalizations=AppLocalizations.of(context)!;
    return Column(children: [
        Container(padding:REdgeInsets.symmetric(horizontal: 8, vertical: 16),
          width: double.infinity,
          decoration: BoxDecoration(borderRadius:BorderRadius.vertical(
              bottom: Radius.circular(16.r)),
               color: Theme.of(context).primaryColor,
          ),
          child: SafeArea(
            right: false,
            left:false ,
            bottom: false,
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              Row(children: [
                Column( spacing: 8,  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(appLocalizations.welcome_back,style:Theme.of(context).textTheme.labelSmall),
                  Text("John Safwat",style: Theme.of(context).textTheme.bodyLarge,),
                  Row(children: [
                    Icon(Icons.location_on_outlined,color: themeProvider.isDark?ColorsManager.ofWhite:ColorsManager.white,),
                    Text("Cairo , Egypt",style: Theme.of(context).textTheme.labelMedium,)
                  ],),


                ],),
                Spacer(),
                Row(children: [
                  IconButton(icon:Icon(color: themeProvider.isDark?ColorsManager.ofWhite:ColorsManager.white,themeProvider.isDark?Icons.dark_mode:Icons.light_mode_outlined,),onPressed: (){
                    themeProvider.changeAppTheme(themeProvider.isDark?ThemeMode.light:ThemeMode.dark);
                  },),
                  SizedBox(width: 10.w,),
                  InkWell(onTap: (){
                    languageProvider.changeAppLanguage(languageProvider.isEnglish?"ar":"en");
                  },
                    child: Card(color: themeProvider.isDark?ColorsManager.ofWhite:ColorsManager.whiteBlue,
                        child: Padding(
                      padding: REdgeInsets.all(8.0),
                      child: Text(languageProvider.isEnglish?"EN":"AR",style: Theme.of(context).textTheme.titleMedium,),
                    )),
                  ),

                ],)
              ],),
                SizedBox(height:14.h ,),
CustomTabBar(categories: CategoryModel.getCategoryWithAll(context), selectedBgColor: ColorsManager.white, unselectedBgColor: Colors.transparent, selectedFgColor:ColorsManager.blue, unselectedFgColor: ColorsManager.white)
            ],),
          ),
        ),
      Expanded(child: ListView.builder(padding: EdgeInsets.zero,
        itemBuilder: (context, index) =>EventItem(event:EventModel(category: CategoryModel.getCategory(context)[3], title: "FSDGFHG", description: "JHJGHFDF", data: DateTime.now(), timeOfDay: TimeOfDay.now()) ,) ,itemCount: 20,
      )
      )

      ],);

  }
}
