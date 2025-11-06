import 'package:evently/config/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manager.dart';

class CustomDropDownItem extends StatelessWidget {
  const CustomDropDownItem({super.key,required this.label,required this.selectedLabel,required this.menuItems,this.onChange});
final String label;
final String selectedLabel;
final List<String> menuItems;
final void Function(String?)?onChange;
  @override
  Widget build(BuildContext context) {
    return Container(margin: REdgeInsets.symmetric(horizontal: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(label,style: Theme.of(context).textTheme.labelLarge,),
        SizedBox(height: 16.h,),
        Container(width: double.infinity,padding:REdgeInsets.all(8) ,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.r),
          border: Border.all(width: 1,color: ColorsManager.blue),
          ),
          child: Row(children: [
            Text(selectedLabel,style: TextStyle(color: ColorsManager.blue,fontSize:20.sp ,fontWeight: FontWeight.w700,),),
            Spacer(),
            DropdownButton(
              underline: SizedBox.shrink(),
              iconEnabledColor: ColorsManager.blue,
                iconDisabledColor: ColorsManager.blue,
              iconSize: 32,

                items: menuItems.map((item)=>DropdownMenuItem(value:item,child:Text(item))).toList() , onChanged: onChange)
          ],),
        )
      ],
        
      ),
    );
  }
}
