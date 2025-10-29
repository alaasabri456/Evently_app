import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/resources/validators.dart';
import 'package:evently/core/ui_utils.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/core/widgets/custom_text_button.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/firebase/firebase_service.dart';
import 'package:evently/models/login_request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes_manager/routes_manager.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool securePassword=true;
GlobalKey<FormState> _formKey=GlobalKey<FormState>();
late TextEditingController _emailController;
late TextEditingController _passwordController;
@override
  void initState() {
  super.initState();
  _emailController=TextEditingController();
  _passwordController=TextEditingController();

  }
  @override
  void dispose() {
  _emailController.dispose();
  _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: REdgeInsets.only(top:47,left: 8,right: 8,bottom:MediaQuery.of(context).viewInsets.bottom),
        child:  SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(ImageAssets.logo),
                SizedBox(height: 24.h,),
                CustomTextFormField(controller:_emailController,validator:Validator.validateEmail,labelText: "E_mail", keyboardType: TextInputType.emailAddress,prefixIcon: Icon(Icons.email),),
                SizedBox(height: 16.h,),
                CustomTextFormField(controller:_passwordController,validator:Validator.validatePassword,labelText: "Password", keyboardType: TextInputType.visiblePassword,prefixIcon: Icon(Icons.lock),suffixIcon:IconButton(icon:securePassword? Icon(Icons.visibility_off): Icon(Icons.visibility),onPressed: _onTogglePasswordIcon,),isSecure:securePassword ,),
                SizedBox(height: 16.h,),
                Container(alignment:AlignmentGeometry.centerRight,child: CustomTextButton(text: "forget password ?", onTap: (){})),
                SizedBox(height: 24.h,),
                Container(width: double.infinity,child: CustomElevatedButton(onPressed: _login, text: "Login")),
                SizedBox(height: 24.h,),
                Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                  Text("Don’t Have Account ? ",style:Theme.of(context).textTheme.bodySmall,),
                  CustomTextButton(onTap: (){
                    Navigator.pushReplacementNamed(context, RoutesManager.register);
                  },text: "Create account")
                ],

                ),
                SizedBox(height: 24.h,),
                Row(mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(  indent: 42.w,
                      endIndent: 16.w,
                      thickness: 1,
                      color: ColorsManager.blue,)),
                    Text("or",style: TextStyle( fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.blue,),),
                    Expanded(child: Divider(  indent: 16.w,
                      endIndent: 42.w,
                      thickness: 1,
                      color: ColorsManager.blue,)),
                  ],),
                SizedBox(height: 24.h,),
                OutlinedButton(onPressed: (){}, child:
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Image.asset(ImageAssets.googleIcon),
                  SizedBox(width: 10.w,),
                  Text("Login With Google",style: TextStyle( fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.blue,),),
                ],)),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _onTogglePasswordIcon() {
    setState(() {
      securePassword = !securePassword;
    });
  }

  Future<void> _login() async {

    if(_formKey.currentState?.validate()==false)return;
    try {
      UiUtils.showLoading(context,false);
      UserCredential userCredential = await FirebaseService.login(LoginRequest(
          email: _emailController.text, password: _passwordController.text));
      UiUtils.hideDialog(context);
      UiUtils.showToastMessage("Logged_In successfully", Colors.green);
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    } on FirebaseAuthException catch(e){
      UiUtils.hideDialog(context);
      UiUtils.showToastMessage(e.code, Colors.red);
    }
    catch(e){
      UiUtils.hideDialog(context);
      UiUtils.showToastMessage("failed to login", Colors.red);
    }
  }
}
