import 'package:flutter/material.dart';
import 'package:tikare/utils/app_colors.dart';
import 'package:tikare/utils/app_font_style.dart';

class CustomButton extends StatelessWidget{
  final String label;
  final Function(BuildContext) onSubmit;
  const CustomButton({super.key,required this.label,required this.onSubmit});
  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap:()=>onSubmit(context),
      child:Container(
     padding: EdgeInsets.all(10),
      decoration:BoxDecoration(
        color:AppColors.appBlueColor
      ),
      child:Center(child:Text(label,style:AppFontStyle.boldText,)
      ),
      ),
    );
  }
}