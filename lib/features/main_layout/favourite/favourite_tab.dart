import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/event_item.dart';
import '../../../models/category_model.dart';
import '../../../models/event_model.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations=AppLocalizations.of(context)!;
    return SafeArea(
      child: Column(
        children: [   Padding(
      padding:REdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
          decoration: InputDecoration(
              prefixIcon:Icon(Icons.search,color: ColorsManager.blue,),
        hintText:appLocalizations.search_for_event,
        hintStyle:TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorsManager.blue),

          ),
      
        ),),
          Expanded(child: ListView.builder(itemBuilder: (context, index) =>EventItem(event:EventModel(id: "",category: CategoryModel.getCategory(context)[3], title: "FSDGFHG", description: "JHJGHFDF", dateTime: DateTime.now()) ,) ,itemCount: 20,
          )
          )
        ],
      ),
    );
  }
}
