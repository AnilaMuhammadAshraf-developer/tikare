import 'package:flutter/material.dart';
import 'package:tikare/screens/chat.dart';
import 'package:tikare/screens/home.dart';
import 'package:tikare/utils/helper..dart';
import 'package:tikare/widgets/custom_appbar.dart';
import 'package:tikare/widgets/custom_bottombar.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});
  @override
  _MasterScreenState createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  int _currentIndex=0;
  String? token;
  final List<Map<String, dynamic>> _pages = [
    {'title': 'Home', 'screen': HomeScreen(), 'icon': Icon(Icons.home)},
    {'title': 'My Bookings', 'screen': HomeScreen(), 'icon': Icon(Icons.book)},
    {'title': 'Chats', 'screen': ChatScreen(), 'icon': Icon(Icons.chat)},
    {
      'title': 'My Services',
      'screen': HomeScreen(),
      'icon': Icon(Icons.design_services_sharp),
    },
    {'title': 'My Profile', 'screen': HomeScreen(), 'icon': Icon(Icons.person)},
  ];

 void _onBottomClick(int index){
  print("this is selected $index");
     setState(() {
       
       _currentIndex=index;
  });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title:_pages[_currentIndex]['title']),
      body: _pages[_currentIndex]['screen'],
      bottomNavigationBar: CustomBottombar(pages: _pages, selectedIndex: _currentIndex, onClick:_onBottomClick),
    );
  }
}
