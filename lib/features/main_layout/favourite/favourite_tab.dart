import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/firebase/firebase_service.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/event_item.dart';

import '../../../models/event_model.dart';
import '../../../models/user_model.dart';
import '../../../providers/theme_provider.dart';

class FavouriteTab extends StatefulWidget {
  const FavouriteTab({super.key});

  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  String searchText = "";
  late Stream<UserModel?> userStream;
  @override
  void initState() {
    super.initState();
    userStream = FirebaseService.getUserStream(UserModel.currentUser!.id);
  }
  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<ThemeProvider>(context);
    AppLocalizations appLocalizations=AppLocalizations.of(context)!;
    return SafeArea(
      child: Column(
        children: [   Padding(
      padding:REdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(style: TextStyle(color: themeProvider.isDark? ColorsManager.ofWhite:ColorsManager.blue),
        onChanged: (value) {
         searchText=value;
         setState(() {

         });
        },
          decoration: InputDecoration(

              prefixIcon:Icon(Icons.search,color: ColorsManager.blue,),
        hintText:appLocalizations.search_for_event,
        hintStyle:TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorsManager.blue),

          ),

        ),),
          StreamBuilder<UserModel?>(
            stream: userStream,
            builder: (context, userSnapshot) {
              if (userSnapshot.hasData && userSnapshot.data != null) {
                UserModel.currentUser = userSnapshot.data;

                return StreamBuilder<List<EventModel>>(
                  stream: FirebaseService.getFavoriteEventsRealTimeUpdate(context),
                  builder: (context, eventsSnapshot) {
                    if (eventsSnapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (eventsSnapshot.hasError) {
                      return Center(child: Text(eventsSnapshot.error.toString()));
                    }

                    List<EventModel> favEvents = eventsSnapshot.data ?? [];

                    if (searchText.isNotEmpty) {
                      favEvents = filterByEventTitle(searchText, favEvents);
                    }
                    return Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => EventItem(
                            event: favEvents[index],
                            markAsFavorite: true,
                          ),
                          itemCount: favEvents.length,
                        )
                    );
                  },
                );
             }
              return Center(child: CircularProgressIndicator());
            },
          ),
    //       FutureBuilder(future: FirebaseService.getFavouriteEvents(context),
    //           builder: (context, snapshot) {
    //             if(snapshot.connectionState==ConnectionState.waiting)return Center(child: CircularProgressIndicator(),);
    // if (snapshot.hasError)return Center(child: Text(snapshot.error.toString()));
    // List<EventModel>favEvents=snapshot.data??[];
    // if (!searchText.isEmpty) {
    //   favEvents=filterByEventTitle(searchText, favEvents);
    // }
    // return   Expanded(child: ListView.builder(itemBuilder: (context, index) =>EventItem(event:favEvents[index],markAsFavorite: true,) ,itemCount: favEvents.length,
    // )
    // );
    //           },),

        ],
      ),
    );
  }

  List<EventModel> filterByEventTitle(String value,List<EventModel>events){
    List<EventModel>  filtered=events.where((event)=>event.title.toLowerCase().contains(value.toLowerCase())).toList();
    return filtered;
  }
}
