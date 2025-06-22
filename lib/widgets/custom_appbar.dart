import 'package:flutter/material.dart';
import 'package:tikare/utils/app_colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const CustomAppbar({super.key, required this.title});
  @override
  Widget build(BuildContext context){
    return AppBar(
      backgroundColor: AppColors.appBlueColor,
      title:Text(title,style:TextStyle(color:AppColors.appBlackColor)),
      centerTitle: true,
      leading: Builder(builder:(context)=>
      Padding(
        padding: EdgeInsets.all(10.0),
       
        child:Container(
       
         decoration: BoxDecoration(
            color:AppColors.appWhiteColor,
            borderRadius: BorderRadius.circular(10)
          ),
        child:IconButton(icon:Icon(Icons.sort_sharp,color: AppColors.appTextFieldColor,),onPressed: Scaffold.of(context).openDrawer,)
      ),
        
      ),
      ),
      
      actions:[
        Padding(padding: EdgeInsets.all(10.0),
        
        child:SizedBox(
          width:40,height:50,
          child:Container(
          
          decoration: BoxDecoration(
            color:AppColors.appWhiteColor,
             borderRadius: BorderRadius.circular(10)
          ),
          child:Icon(Icons.notifications_none_outlined,color:AppColors.appTextFieldColor)
        )),)
      
      ]
    );
  }
  
@override
Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}