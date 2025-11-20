import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateLocationCard extends StatelessWidget {
  const DateLocationCard({super.key,required this.icon,required this.title,this.subTitle,this.suffixIcon});
final IconData icon;
final String title;
final String? subTitle;
final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container( padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      border: Border.all(width: 1,color: ColorsManager.blue),

    ),
        child: Row(
           children: [
            Container(padding: REdgeInsets.all(12),
              decoration: BoxDecoration(color: ColorsManager.blue,borderRadius: BorderRadius.circular(8.r) ),
              child: Icon(icon),),
             SizedBox(width: 8.w),
             Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               Text(title,),
               Visibility(visible:subTitle!=null,child: Text(subTitle??"",style: TextStyle(),)),

             ],),
             Spacer(),
             Icon(suffixIcon,color: ColorsManager.blue,),
           ],
        ));
  }
}
