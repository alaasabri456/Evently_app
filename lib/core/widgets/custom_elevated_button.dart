import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.onPressed,required this.text});
final String text;
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: onPressed, child:Text(text));
  }
}
