import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabItem extends StatelessWidget {
  const CustomTabItem({super.key,required this.category
    , required this.selectedBgColor,
    required this.unselectedBgColor,
    required this.selectedFgColor,
    required this.unselectedFgColor,
    required this.isSelected
  });
final CategoryModel category;
final Color  selectedBgColor;
  final Color unselectedBgColor;
  final Color selectedFgColor;
  final Color unselectedFgColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(padding: REdgeInsets.symmetric(horizontal:16 ,vertical: 8),
      decoration: BoxDecoration(color: isSelected?selectedBgColor:unselectedBgColor,
        borderRadius: BorderRadius.circular(46.r),
          border: Border.all(width: 2, color: selectedBgColor)

      ),
      child: Row(
        children: [Icon(category.categIcon,color: isSelected?selectedFgColor:unselectedFgColor,),
          SizedBox(width: 8.w,),
          Text(category.categName,style: TextStyle(color: isSelected?selectedFgColor:unselectedFgColor,fontWeight:FontWeight.w500 ,fontSize:16.sp ,),),
        ],
      ),);
  }
}
