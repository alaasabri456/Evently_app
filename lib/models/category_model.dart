import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/resources/assets_manager.dart';

class CategoryModel{
  String categId;
  String categName;
  IconData categIcon;
  String imgPath;
  CategoryModel({required this.categId,required this.categName,required this.categIcon,required this.imgPath});
  static List<CategoryModel> getCategoryWithAll(BuildContext context){
    AppLocalizations appLocalizations=AppLocalizations.of(context)!;
    return [
      CategoryModel(categId:"0", categName:appLocalizations.all , categIcon: Icons.all_inclusive, imgPath: "imgPath"),
      CategoryModel(categId:"1" , categName:appLocalizations.sports  ,categIcon: Icons.sports_football_rounded, imgPath: ImageAssets.sports),
      CategoryModel(categId:"2", categName:appLocalizations.birthday,  categIcon: Icons.cake_rounded, imgPath:ImageAssets.birthday),
      CategoryModel(categId:"3", categName:appLocalizations.meeting,  categIcon: Icons.laptop_mac_rounded, imgPath: ImageAssets.meeting),
      CategoryModel(categId:"4",categName:appLocalizations.gaming,  categIcon: Icons.gamepad_rounded, imgPath: ImageAssets.gaming),
      CategoryModel(categId:"5",categName:appLocalizations.eating, categIcon: Icons.local_pizza_rounded, imgPath:ImageAssets.eating),
      CategoryModel(categId:"6",categName:appLocalizations.holiday , categIcon: Icons.holiday_village_rounded, imgPath: ImageAssets.holiday),
      CategoryModel(categId:"7", categName:appLocalizations.exhibition,  categIcon: Icons.water_drop_rounded, imgPath:ImageAssets.exhibition),
      CategoryModel(categId:"8", categName:appLocalizations.workshop,  categIcon: Icons.workspaces_rounded, imgPath: ImageAssets.workshop),
      CategoryModel(categId:"9", categName:appLocalizations.book_club,  categIcon: Icons.book_online_rounded, imgPath: ImageAssets.bookClub),
    ];
  }

  static List<CategoryModel> getCategory(BuildContext context){
    AppLocalizations appLocalizations=AppLocalizations.of(context)!;
    return [

      CategoryModel(categId:"1", categName:appLocalizations.sports  ,categIcon: Icons.sports_football_rounded, imgPath: ImageAssets.sports),
      CategoryModel(categId:"2", categName:appLocalizations.birthday,  categIcon: Icons.cake_rounded, imgPath:ImageAssets.birthday),
      CategoryModel(categId:"3", categName:appLocalizations.meeting,  categIcon: Icons.laptop_mac_rounded, imgPath: ImageAssets.meeting),
      CategoryModel(categId:"4",categName:appLocalizations.gaming,  categIcon: Icons.gamepad_rounded, imgPath: ImageAssets.gaming),
      CategoryModel(categId:"5",categName:appLocalizations.eating, categIcon: Icons.local_pizza_rounded, imgPath:ImageAssets.eating),
      CategoryModel(categId:"6",categName:appLocalizations.holiday , categIcon: Icons.holiday_village_rounded, imgPath: ImageAssets.holiday),
      CategoryModel(categId:"7", categName:appLocalizations.exhibition,  categIcon: Icons.water_drop_rounded, imgPath:ImageAssets.exhibition),
      CategoryModel(categId:"8", categName:appLocalizations.workshop,  categIcon: Icons.workspaces_rounded, imgPath: ImageAssets.workshop),
      CategoryModel(categId:"9", categName:appLocalizations.book_club,  categIcon: Icons.book_online_rounded, imgPath: ImageAssets.bookClub),

    ];
  }
}
