

import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/core/widgets/custom_tab_bar.dart';
import 'package:evently/core/widgets/custom_text_button.dart';
import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/custom_text_form_field.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  CategoryModel selectedCategory=CategoryModel.category[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( "Create Event"),

      ),
      body: Padding(
        padding: REdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(selectedCategory.imgPath)),
              SizedBox(height:16.h),
              CustomTabBar(onCategotyItemClick: (category) {
                selectedCategory=category;
                setState(() {

                });
              },categories: CategoryModel.category, selectedBgColor: ColorsManager.blue, unselectedBgColor: Colors.transparent, selectedFgColor:ColorsManager.white , unselectedFgColor: ColorsManager.blue),
              SizedBox(height:16.h),
              Text("Title",style:TextStyle(fontWeight:FontWeight.w500 ,fontSize:16.sp ,color: ColorsManager.black)),
                SizedBox(height: 8.h),
                CustomTextFormField(labelText:"Event Title" ,keyboardType:TextInputType.text,
          prefixIcon:Icon(Icons.edit_note),),
              SizedBox(height: 16.h),
              Text("Description",style:TextStyle(fontWeight:FontWeight.w500 ,fontSize:16.sp ,color: ColorsManager.black)),
              SizedBox(height: 8.h),
              CustomTextFormField(hintText:"Event description" ,maxLiens: 4,keyboardType:TextInputType.text,),
              SizedBox(height: 16.h),
              Row(children: [Icon(Icons.calendar_month,color: ColorsManager.black,),
                SizedBox(width: 8.w,),
                Text("Event Date",style:TextStyle(fontWeight:FontWeight.w500 ,fontSize:16.sp ,color: ColorsManager.black)),
                Spacer(),
                CustomTextButton(text: "Choose Date", onTap: (){
                  showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365)));
                })
              ],),
              SizedBox(height: 16.h),
              Row(children: [Icon(Icons.timer_outlined,color: ColorsManager.black,),
                SizedBox(width: 8.w,),
                Text("Event Time",style:TextStyle(fontWeight:FontWeight.w500 ,fontSize:16.sp ,color: ColorsManager.black)),
                Spacer(),
                CustomTextButton(text: "Choose Time", onTap: (){
                  showTimePicker(context: context, initialTime: TimeOfDay.now());
                })
              ],),
              SizedBox(height: 16.h),
              Text("Location",style:TextStyle(fontWeight:FontWeight.w500 ,fontSize:16.sp ,color: ColorsManager.black)),
              SizedBox(height: 8.h),
              CustomElevatedButton(onPressed: (){}, text: "Add Event")

            ],
          ),
        ),
      ),
    );
  }
}
