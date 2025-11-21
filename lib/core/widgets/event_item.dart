import 'package:evently/core/extensions/date_time_ex.dart';
import 'package:evently/core/routes_manager/routes_manager.dart';
import 'package:evently/firebase/firebase_service.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/user_model.dart';
import '../resources/colors_manager.dart';
import 'package:intl/intl.dart';
class EventItem extends StatefulWidget {
  const EventItem({super.key, required this.event,this.markAsFavorite});
final EventModel event;
final bool? markAsFavorite;
  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  late bool isFavorite = widget.markAsFavorite??false;





  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {Navigator.pushNamed(context, RoutesManager.eventDetails,arguments: widget.event);
    },
      child: Container(
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
                    Text(widget.event.dateTime.viewDayNumber,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: ColorsManager.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.event.dateTime.viewMonthName,
                        style: TextStyle( fontSize: 14.sp,
                          color: ColorsManager.blue,
                          fontWeight: FontWeight.bold,)
                    ),
                  ],),
              ),
            ),

            Spacer(),
            Card(
              child: Padding(
              padding: REdgeInsets.all(8.0),
              child: Row(children: [
                Expanded(child: Text( widget.event.title,
                  style: Theme.of(context).textTheme.titleSmall,)),
                IconButton(onPressed:_markEvent,
                    icon: Icon(
                        isFavorite ? Icons.favorite: Icons.favorite_border),color: ColorsManager.blue,),

              ],

              ),
            ),),
          ],),

      ),
    );
  }



  void _markEvent() async{
    if(isFavorite){
     await FirebaseService.removeEventFromFavourite(widget.event);
     isFavorite=false;
    }
    else {
      isFavorite=true;
      await FirebaseService.addEventToFavourites(widget.event);
    }

    setState(() {});
  }
}

