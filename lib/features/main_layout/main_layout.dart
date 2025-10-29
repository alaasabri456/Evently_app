import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/features/main_layout/favourite/favourite_tab.dart';
import 'package:evently/features/main_layout/home/home_tab.dart';
import 'package:evently/features/main_layout/map/map_tab.dart';
import 'package:evently/features/main_layout/profile/profile_tab.dart';
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
  @override
  Widget build(BuildContext context) {
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
          BottomNavigationBarItem(icon: Icon(selectedIndex==0?Icons.home_filled:Icons.home_outlined,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(selectedIndex==1?Icons.location_on_sharp:Icons.location_on_outlined,),label:"Map" ),
          BottomNavigationBarItem(icon: Icon(selectedIndex==2?Icons.favorite:Icons.favorite_outline,),label:"Favourite" ),
          BottomNavigationBarItem(icon: Icon(selectedIndex==3?Icons.person:Icons.person_2_outlined,),label:"profile" ),
        ],
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: (){},child: Icon(Icons.add),);
  }

  void _onTap(int newIndex){

      setState(( ) {
        selectedIndex=newIndex;
      });
    }
}
