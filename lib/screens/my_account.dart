import 'package:flutter/material.dart';
import 'package:tikare/utils/app_colors.dart';

class MyAccount extends StatelessWidget{
  const MyAccount({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          color:AppColors.appDrawerColor1
        ),
        child:Text("My Account")
      )
    );
  }
}