import 'package:evently/core/extensions/date_time_ex.dart';
import 'package:evently/core/widgets/date_location_card.dart';
import 'package:evently/firebase/firebase_service.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/colors_manager.dart';
import '../../core/routes_manager/routes_manager.dart';
import '../../l10n/app_localizations.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key,required this.event});
final EventModel event;
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations=AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.event_details),
actions: [Visibility(visible:UserModel.currentUser!.id==event.uid,child: IconButton(onPressed:(){
            Navigator.pushReplacementNamed(
              context,
              RoutesManager.createEvent,
              arguments: event,
            );
}, icon: Icon(Icons.edit))),
Visibility(visible:UserModel.currentUser!.id==event.uid,child: IconButton(onPressed: () async {
  await FirebaseService.deleteEvent(context, event.id);
   if (context.mounted) {
                  Navigator.pop(context);
                }
}, icon: Icon(Icons.delete),color: ColorsManager.darkRed,))
],
      ),
      body:Padding(
        padding: REdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16.r),
                child: Image.asset(event.category.imgPath),
              ),
                           SizedBox(height: 16.h),
                          Text(event.title ?? '', style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w500,color:ColorsManager.blue),),
                          SizedBox(height: 16.h),
                        DateLocationCard(icon: Icons.calendar_month,title: event.dateTime.toFormattedDateCard,subTitle: event.dateTime.toFormattedTimeCard,),
              SizedBox(height: 16.h),
              DateLocationCard(
              icon: Icons.gps_fixed_rounded,
              title: "Cairo,Egypt",suffixIcon: Icons.arrow_forward_ios_rounded,),
              SizedBox(height: 100.h,),
              Text(appLocalizations.description,style:Theme.of(context).textTheme.bodySmall,),
              Container(child: Text(event.description,style:Theme.of(context).textTheme.bodySmall)),
            ],
          ),
        ),
      ) ,
    );
  }
}
