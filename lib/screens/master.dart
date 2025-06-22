import 'package:flutter/material.dart';
import 'package:tikare/constants/app_data.dart';
import 'package:tikare/screens/chat.dart';
import 'package:tikare/screens/home.dart';
import 'package:tikare/utils/helper..dart';
import 'package:tikare/widgets/custom_appbar.dart';
import 'package:tikare/widgets/custom_bottombar.dart';
import 'package:tikare/widgets/custom_drawer.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});
  @override
  _MasterScreenState createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  int _currentIndex=0;
  
  
void _drawerClose(context){
  print("ab close hoga drawwer");
 Navigator.pop(context);
}

 void _onBottomClick(int index){
  print("this is selected $index");
     setState(() {
       
       _currentIndex=index;
  });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title:AppData().bottomNavPagesList[_currentIndex]['title']),
      drawer: CustomDrawer(pages: AppData().drawerList),
      body: AppData().bottomNavPagesList[_currentIndex]['screen'],
      bottomNavigationBar: CustomBottombar(pages: AppData().bottomNavPagesList, selectedIndex: _currentIndex, onClick:_onBottomClick),
    );
  }
}
