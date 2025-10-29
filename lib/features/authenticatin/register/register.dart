import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/validators.dart';
import 'package:evently/core/routes_manager/routes_manager.dart';
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
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController=TextEditingController();
  late TextEditingController _emailController=TextEditingController();
  late TextEditingController _passwordController=TextEditingController();
  late TextEditingController _rePasswordController=TextEditingController();
  @override
  void initState() {
    super.initState();
    _nameController=TextEditingController();
   _emailController=TextEditingController();
   _passwordController=TextEditingController();
   _rePasswordController=TextEditingController();

  }
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,//keyboard
      body:Padding(
        padding:REdgeInsets.only(top:47,left: 8,right: 8,bottom:MediaQuery.of(context).viewInsets.top),//keyboard
        child: SingleChildScrollView(//handle overflow
          child: Form(
            key: _formKey,
            child: Column(children: [
              Image.asset(ImageAssets.logo),
              SizedBox(height: 24.h,),
              CustomTextFormField(controller:_nameController,validator:Validator.validateName,
                prefixIcon: Icon(Icons.person),labelText: "Name", keyboardType:TextInputType.name,),
              SizedBox(height: 16.h,),
              CustomTextFormField(controller:_emailController,validator: Validator.validateEmail,
                prefixIcon:Icon(Icons.email),labelText: "Email", keyboardType:TextInputType.emailAddress,),
              SizedBox(height: 16.h,),
              CustomTextFormField(controller: _passwordController,
                validator:Validator.validatePassword,
                prefixIcon:Icon(Icons.lock),labelText: "Password", keyboardType:TextInputType.visiblePassword,suffixIcon:IconButton(icon:Icon(securePassword?Icons.visibility_off:Icons.visibility) ,onPressed: _onTogglePasswordIcon),isSecure: securePassword,),
              SizedBox(height: 16.h,),
              CustomTextFormField(controller:_rePasswordController,validator:Validator.validatePassword,
                prefixIcon: Icon(Icons.email),labelText: "Re password", keyboardType:TextInputType.visiblePassword,suffixIcon:IconButton(icon:Icon(secureRePassword?Icons.visibility_off:Icons.visibility) ,onPressed:_onToggleRePasswordIcon ),isSecure: secureRePassword, ),
              SizedBox(height: 16.h,),
              Container(width: double.infinity,child: CustomElevatedButton(onPressed:_createAccount, text: "Create Account")),
              SizedBox(height: 16.h,),
              Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                Text("Already Have Account ? ",style:Theme.of(context).textTheme.bodySmall,),
                CustomTextButton(onTap: (){
                  Navigator.pushReplacementNamed(context, RoutesManager.login);
                  },text: "Login")
              ],
            
              ),
            
            ]
            
            ),
          ),
        ),
      )
    );
  }


  void _createAccount(){
    if (_formKey.currentState?.validate() == false)
      return;
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
