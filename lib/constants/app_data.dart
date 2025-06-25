import 'package:tikare/screens/chat.dart';
import 'package:tikare/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:tikare/screens/master.dart';
import 'package:tikare/screens/my_account.dart';
import 'package:tikare/utils/app_colors.dart';

class AppData {
  final List<Map<String, dynamic>> bottomNavPagesList = [
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

  final List<Map<String, dynamic>> drawerList = [
    {'title': 'Home', 'screen': MasterScreen(), 'icon': Icon(Icons.home,color: AppColors.appBlackColor)},
    {'title': 'My Account', 'screen': MyAccount(), 'icon': Icon(Icons.book,color: AppColors.appBlackColor)},
    {
      'title': 'Booking History',
      'screen': MasterScreen(),
      'icon': Icon(Icons.chat,color: AppColors.appBlackColor),
    },
    {
      'title': 'Payment History',
      'screen': MasterScreen(),
      'icon': Icon(Icons.payment,color: AppColors.appBlackColor),
    },
    {'title': 'Settings', 'screen': MasterScreen(), 'icon': Icon(Icons.settings,color: AppColors.appBlackColor)},
    {
      'title': 'Rating & Reviews',
      'screen': MasterScreen(),
      'icon': Icon(Icons.grade,color: AppColors.appBlackColor),
    },
    {
      'title': 'Service Statistics',
      'screen': MasterScreen(),
      'icon': Icon(Icons.grading_sharp,color: AppColors.appBlackColor,),
    },
  ];
}
