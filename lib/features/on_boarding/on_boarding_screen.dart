import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/widgets/custom_arrow_button.dart';
import 'package:evently/features/on_boarding/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/resources/colors_manager.dart';
import '../../core/routes_manager/routes_manager.dart';
import '../../providers/theme_provider.dart';
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  Future<void> _finishOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true);}
  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<ThemeProvider>(context);

    return  IntroductionScreen(
          globalHeader: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(ImageAssets.onboardingLogo,height: 50.h,
                fit: BoxFit.fitHeight,
                ),
          ),
        pages:OnBoardingModel.onBoardingModels.map((model){
          return PageViewModel(bodyWidget: SizedBox.shrink(),
            titleWidget:Padding(
            padding:  REdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 28.h),
                  Image.asset(model.image),
                  SizedBox(height: 28.h),
                  Text(model.title,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: ColorsManager.blue),),
                  SizedBox(height: 28.h,),

                  Text(
                  model.subTitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),



                ],
              ),
            ),



          ),);
          //   title: model.title,
          //   body: model.subTitle,
          //   image: Image.asset(model.image),
          //   decoration: PageDecoration( titleTextStyle: TextStyle(
          //     fontSize: 24.sp,
          //     fontWeight: FontWeight.bold,
          //     color: ColorsManager.blue,
          //   ),
          //     bodyTextStyle: themeProvider.isDark?TextStyle( fontSize: 16,fontWeight: FontWeight.w500,
          //     color: ColorsManager.ofWhite,
          //   ):TextStyle(fontWeight: FontWeight.w500,
          //       fontSize: 16,
          //       color: ColorsManager.black,
          //     ),
          //     imageFlex: 3,
          //     titlePadding: EdgeInsets.symmetric(horizontal: 16),
          //
          //
          //   ),
          // );
        }).toList() ,

        dotsDecorator: DotsDecorator(
          color: themeProvider.isDark?ColorsManager.ofWhite:ColorsManager.black,
          activeColor: ColorsManager.blue,
          activeSize: Size(22, 10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23),
          ),
        ),

        showBackButton: true,
        back: CustomArrowButton(icon: Icons.arrow_back),
        next: CustomArrowButton(icon: Icons.arrow_forward),
        done: CustomArrowButton(icon: Icons.arrow_forward),


        onDone: ()async {
          await _finishOnboarding(context);
          Navigator.pushReplacementNamed(context, RoutesManager.splashScreen);
        },




    );
  }
}
