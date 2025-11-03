import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/widgets/custom_tab_bar.dart';
import 'package:evently/core/widgets/custom_tab_item.dart';
import 'package:evently/core/widgets/event_item.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Container(padding:REdgeInsets.symmetric(horizontal: 8, vertical: 16),
          width: double.infinity,
          decoration: BoxDecoration(borderRadius:BorderRadius.vertical(
              bottom: Radius.circular(16.r)),
              color: ColorsManager.blue
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
                  Text("Welcome Back ✨",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color:ColorsManager.white),),
                  Text("John Safwat",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold,color:ColorsManager.white),),
                  Row(children: [
                    Icon(Icons.location_on_outlined,color: ColorsManager.white,),
                    Text("Cairo , Egypt",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500,color:ColorsManager.white),)
                  ],),


                ],),
                Spacer(),
                Row(children: [
                  IconButton(icon:Icon(Icons.light_mode_outlined,color: ColorsManager.white,),onPressed: (){},),
                  SizedBox(width: 10.w,),
                  InkWell(onTap: (){},
                    child: Card(color:ColorsManager.white,child: Padding(
                      padding: REdgeInsets.all(8.0),
                      child: Text("EN",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: ColorsManager.blue),),
                    )),
                  ),

                ],)
              ],),
                SizedBox(height:14.h ,),
CustomTabBar(categories: CategoryModel.categoryWithAll, selectedBgColor: ColorsManager.white, unselectedBgColor: Colors.transparent, selectedFgColor:ColorsManager.blue, unselectedFgColor: ColorsManager.white)
            ],),
          ),
        ),
      Expanded(child: ListView.builder(itemBuilder: (context, index) =>EventItem(event:EventModel(category: CategoryModel.category[3], title: "FSDGFHG", description: "JHJGHFDF", data: DateTime.now(), timeOfDay: TimeOfDay.now()) ,) ,itemCount: 20,
      )
      )

      ],);

  }
}
