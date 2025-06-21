import 'package:flutter/material.dart';
import 'package:tikare/utils/app_colors.dart';

class CustomBottombar extends StatelessWidget{
  final List<Map<String,dynamic>> pages;
  final int selectedIndex;
  final Function(int) onClick;
  const CustomBottombar({super.key,required this.pages,required this.selectedIndex,required this.onClick});
  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.appBlueColor,
      selectedItemColor: AppColors.appBlackColor,

      currentIndex: selectedIndex,
      onTap:onClick,
      items:List.generate(pages.length,(index){
        return BottomNavigationBarItem(icon: pages[index]['icon'],label: pages[index]['title'],);
      })
    );
  }
}