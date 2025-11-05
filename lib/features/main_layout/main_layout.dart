import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/routes_manager/routes_manager.dart';
import 'package:evently/features/main_layout/favourite/favourite_tab.dart';
import 'package:evently/features/main_layout/home/home_tab.dart';
import 'package:evently/features/main_layout/map/map_tab.dart';
import 'package:evently/features/main_layout/profile/profile_tab.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> tabs=[
    HomeTab(),MapTab(),FavouriteTab(),ProfileTab()
  ];
  int selectedIndex=0;
  late  AppLocalizations appLocalizations;
  @override
  Widget build(BuildContext context) {
    appLocalizations=AppLocalizations.of(context)!;
    return Scaffold(
      extendBody: true,//3shan el background y_ban t7t el floatingAction
      body: tabs[selectedIndex],
      floatingActionButton:_buildFloatingActionButton(),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  BottomAppBar _buildBottomAppBar() {
    return BottomAppBar(notchMargin: 8,
      child: BottomNavigationBar(onTap: _onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(selectedIndex==0?Icons.home_filled:Icons.home_outlined,),label:appLocalizations.home),
          BottomNavigationBarItem(icon: Icon(selectedIndex==1?Icons.location_on_sharp:Icons.location_on_outlined,),label:appLocalizations.map ),
          BottomNavigationBarItem(icon: Icon(selectedIndex==2?Icons.favorite:Icons.favorite_outline,),label:appLocalizations.favourite ),
          BottomNavigationBarItem(icon: Icon(selectedIndex==3?Icons.person:Icons.person_2_outlined,),label:appLocalizations.profile ),
        ],
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: (){
        Navigator.pushNamed(context, RoutesManager.createEvent);
      },child: Icon(Icons.add),);
  }

  void _onTap(int newIndex){

      setState(( ) {
        selectedIndex=newIndex;
      });
    }
}
