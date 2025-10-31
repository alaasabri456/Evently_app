import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manager.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.event});
final EventModel event;
  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,
      height: 203.h,
      margin: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding:REdgeInsets.all(8) ,
      decoration:BoxDecoration(
        border: Border.all(width: 1.w,color:  ColorsManager.blue,),
          borderRadius: BorderRadius.circular(16.r),
          image:DecorationImage(fit: BoxFit.fill,image: AssetImage( event.category.imgPath)) ) ,
      child:Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Card(
          child: Padding(
            padding: REdgeInsets.all(8.0),
            child: Column(
              children: [
              Text("27"),
              Text("Nov"),
            ],),
          ),
        ),
        Spacer(),
        Card(child: Padding(
          padding: REdgeInsets.all(2.0),
          child: Row(children: [
            Expanded(child: Text(event.title)),
            IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),

          ],

          ),
        ),),
      ],) ,

    );
  }
}
