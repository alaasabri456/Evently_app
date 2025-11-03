import 'package:evently/core/extensions/date_time_ex.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manager.dart';
import 'package:intl/intl.dart';
class EventItem extends StatefulWidget {
  const EventItem({super.key, required this.event});
final EventModel event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 203.h,
      margin: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: ColorsManager.blue,),
          borderRadius: BorderRadius.circular(16.r),
          image: DecorationImage(fit: BoxFit.fill,
              image: AssetImage(widget.event.category.imgPath))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: REdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(widget.event.data.viewDayNumber),
                  Text(widget.event.data.viewMonthName),
                ],),
            ),
          ),
          Spacer(),
          Card(child: Padding(
            padding: REdgeInsets.all(8.0),
            child: Row(children: [
              Expanded(child: Text(widget.event.title)),
              IconButton(onPressed: () {
                isFavorite = !isFavorite;
                setState(() {

                });
              },
                  icon: Icon(
                      isFavorite ? Icons.favorite: Icons.favorite_border),color: ColorsManager.blue,),

            ],

            ),
          ),),
        ],),

    );
  }


}

