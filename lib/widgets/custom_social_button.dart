import 'package:flutter/material.dart';
import 'package:tikare/utils/app_colors.dart';

class CustomSocialButton extends StatelessWidget{
  final String label;
  final IconData icon;
  // final Function(String?)  onTapWithType;
  final VoidCallback? onTapWithType;
   final Color bgColor;
   final Color textColor;
   final Color iconColor;
  const CustomSocialButton({super.key,required this.label,required this.icon,required this.iconColor, required this.onTapWithType,this.bgColor=AppColors.appBlueColor, this.textColor=AppColors.appBlackColor});
  @override
  Widget build(BuildContext context){
    return InkWell( 
      onTap:onTapWithType,
        child:Container(
        margin: EdgeInsets.only(left:20,right:20,top:10),
        padding: EdgeInsets.all(10),
      decoration:BoxDecoration(
        color:bgColor
      ),
    
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            Icon(icon,color:iconColor),
            SizedBox(width:10),
            Text(label,style:TextStyle(color:textColor,fontWeight:FontWeight.bold ))
        ],)
        ) 
      
    );
  }
}