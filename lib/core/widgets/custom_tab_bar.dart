import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../resources/colors_manager.dart';
import 'custom_tab_item.dart';

class CustomTabBar extends StatefulWidget {
   const CustomTabBar({super.key ,required this.categories,
   required this.selectedBgColor,
   required this.unselectedBgColor,
   required this.selectedFgColor,
   required this.unselectedFgColor,

   });

   final List<CategoryModel>categories;
   final Color  selectedBgColor;
   final Color unselectedBgColor;
   final Color selectedFgColor;
   final Color unselectedFgColor;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(//3mlna wrap 3shan n3rf el length
      length: widget.categories.length,
      child: TabBar(isScrollable: true,
        indicatorColor: Colors.transparent,
        onTap: (newIndex) {
          selectedIndex=newIndex;
          setState(() {

          });
        },
        tabs: widget.categories.map((category) =>CustomTabItem(category: category, selectedBgColor :widget.selectedBgColor, unselectedBgColor: widget.unselectedBgColor, selectedFgColor: widget.selectedFgColor, unselectedFgColor: widget.unselectedFgColor, isSelected: selectedIndex==widget.categories.indexOf(category),)).toList(),

      ),
    );
  }
}
