import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_text_form_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool securePassword=true;
  bool secureRePassword=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,//keyboard
      body:Padding(
        padding:REdgeInsets.only(left: 8,right: 8,bottom:MediaQuery.of(context).viewInsets.top),//keyboard
        child: SingleChildScrollView(//handle overflow
          child: Column(children: [
            Image.asset(ImageAssets.logo),
            SizedBox(height: 24.h,),
            CustomTextFormField(prefixIcon: Icon(Icons.person),labelText: "Name", keyboardType:TextInputType.name,),
            SizedBox(height: 16.h,),
            CustomTextFormField(prefixIcon:Icon(Icons.email),labelText: "Email", keyboardType:TextInputType.emailAddress,),
            SizedBox(height: 16.h,),
            CustomTextFormField(prefixIcon:Icon(Icons.lock),labelText: "Password", keyboardType:TextInputType.visiblePassword,suffixIcon:IconButton(icon:Icon(securePassword?Icons.visibility_off:Icons.visibility) ,onPressed: _onTogglePasswordIcon),isSecure: securePassword,),
            SizedBox(height: 16.h,),
            CustomTextFormField(prefixIcon: Icon(Icons.email),labelText: "Re password", keyboardType:TextInputType.visiblePassword,suffixIcon:IconButton(icon:Icon(secureRePassword?Icons.visibility_off:Icons.visibility) ,onPressed:_onToggleRePasswordIcon ),isSecure: secureRePassword, ),
            SizedBox(height: 16.h,),
            Container(width: double.infinity,child: CustomElevatedButton(onPressed:(){}, text: "Create Account")),
            SizedBox(height: 16.h,),
            Row(mainAxisAlignment:MainAxisAlignment.center,children: [
              Text("Already Have Account ? ",style:Theme.of(context).textTheme.bodySmall,),
              CustomTextButton(onTap: (){},text: "Login")
            ],

            ),

          ]

          ),
        ),
      )
    );
  }
  void _onTogglePasswordIcon(){
    setState(() {
      securePassword=!securePassword;
    });
  }
  void _onToggleRePasswordIcon(){
    setState(() {
      secureRePassword=!secureRePassword;
    });
  }
}
