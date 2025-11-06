

import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/core/widgets/custom_tab_bar.dart';
import 'package:evently/core/widgets/custom_text_button.dart';
import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/custom_text_form_field.dart';
import '../../l10n/app_localizations.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late CategoryModel selectedCategory=CategoryModel.getCategory(context)[0];
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations=AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title:Text(appLocalizations.create_event),

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
              },categories: CategoryModel.getCategory(context), selectedBgColor: ColorsManager.blue, unselectedBgColor: Colors.transparent, selectedFgColor:ColorsManager.white , unselectedFgColor: ColorsManager.blue),
              SizedBox(height:16.h),
              Text(appLocalizations.title,style:Theme.of(context).textTheme.bodySmall),
                SizedBox(height: 8.h),
                CustomTextFormField(hintText:appLocalizations.event_title,keyboardType:TextInputType.text,
          prefixIcon:Icon(Icons.edit_note),),
              SizedBox(height: 16.h),
              Text(appLocalizations.description,style:Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 8.h),
              CustomTextFormField(hintText:appLocalizations.event_description ,maxLiens: 4,keyboardType:TextInputType.text,),
              SizedBox(height: 16.h),
              Row(children: [Icon(Icons.calendar_month,),
                SizedBox(width: 8.w,),
                Text(appLocalizations.event_date,style:Theme.of(context).textTheme.bodySmall),
                Spacer(),
                CustomTextButton(text: appLocalizations.choose_date, onTap: (){
                  showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365)));
                })
              ],),
              SizedBox(height: 16.h),
              Row(children: [Icon(Icons.timer_outlined),
                SizedBox(width: 8.w,),
                Text(appLocalizations.event_time,style:Theme.of(context).textTheme.bodySmall),
                Spacer(),
                CustomTextButton(text:appLocalizations.choose_time, onTap: (){
                  showTimePicker(context: context, initialTime: TimeOfDay.now());
                })
              ],),
              SizedBox(height: 16.h),
              Text(appLocalizations.location,style:Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 30.h),
              SizedBox(height: 8.h),
              CustomElevatedButton(onPressed: (){}, text: appLocalizations.add_event)

            ],
          ),
        ),
      ),
    );
  }
}
