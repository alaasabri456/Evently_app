import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/resources/assets_manager.dart';

class CategoryModel{
  int categId;
  String categName;
  IconData categIcon;
  String imgPath;
  CategoryModel({required this.categId,required this.categName,required this.categIcon,required this.imgPath});
  static List<CategoryModel> categoryWithAll=[
    CategoryModel(categId:0, categName:"All" , categIcon: Icons.all_inclusive, imgPath: "imgPath"),
    CategoryModel(categId:1 , categName:"Sports"  ,categIcon: Icons.sports_football_rounded, imgPath: ImageAssets.sports),
    CategoryModel(categId:2, categName:" Birthday",  categIcon: Icons.cake_rounded, imgPath:ImageAssets.birthday),
    CategoryModel(categId:3, categName:"Meeting",  categIcon: Icons.laptop_mac_rounded, imgPath: ImageAssets.meeting),
    CategoryModel(categId:4,categName:"Gaming",  categIcon: Icons.gamepad_rounded, imgPath: ImageAssets.gaming),
    CategoryModel(categId:5,categName:"Eating", categIcon: Icons.local_pizza_rounded, imgPath:ImageAssets.eating),
    CategoryModel(categId:6,categName:"Holiday" , categIcon: Icons.holiday_village_rounded, imgPath: ImageAssets.holiday),
    CategoryModel(categId:7, categName:"Exhibition",  categIcon: Icons.water_drop_rounded, imgPath:ImageAssets.exhibition),
    CategoryModel(categId:8, categName:"Workshop",  categIcon: Icons.workspaces_rounded, imgPath: ImageAssets.workshop),
    CategoryModel(categId:9, categName:"Book_club",  categIcon: Icons.book_online_rounded, imgPath: ImageAssets.bookClub),
  ];

  static List<CategoryModel> category=[
    CategoryModel(categId:0 , categName:"Sports"  ,categIcon: Icons.sports_football_rounded, imgPath: ImageAssets.sports),
    CategoryModel(categId:1, categName:" Birthday",  categIcon: Icons.cake_rounded, imgPath:ImageAssets.birthday),
    CategoryModel(categId:2, categName:"Meeting",  categIcon: Icons.laptop_mac_rounded, imgPath: ImageAssets.meeting),
    CategoryModel(categId:3,categName:"Gaming",  categIcon: Icons.gamepad_rounded, imgPath: ImageAssets.gaming),
    CategoryModel(categId:4,categName:"Eating", categIcon: Icons.local_pizza_rounded, imgPath:ImageAssets.eating),
    CategoryModel(categId:5,categName:"Holiday" , categIcon: Icons.holiday_village_rounded, imgPath: ImageAssets.holiday),
    CategoryModel(categId:6, categName:"Exhibition",  categIcon: Icons.water_drop_rounded, imgPath:ImageAssets.exhibition),
    CategoryModel(categId:7, categName:"Workshop",  categIcon: Icons.workspaces_rounded, imgPath: ImageAssets.workshop),
    CategoryModel(categId:8, categName:"Book_club",  categIcon: Icons.book_online_rounded, imgPath: ImageAssets.bookClub),
  ];
}
