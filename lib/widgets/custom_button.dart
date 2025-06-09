import 'package:flutter/material.dart';
import 'package:tikare/utils/app_colors.dart';

class CustomButton extends StatelessWidget{
  final String label;
  const CustomButton({super.key,required this.label});
  @override
  Widget build(BuildContext context){
    return Container(
      width:200,
      height:50,
      decoration:BoxDecoration(
        color:AppColors.appBlueColor
      ),
      child:Center(child:Text(label)
      )
    );
  }
}