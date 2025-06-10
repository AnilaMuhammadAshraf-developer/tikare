import 'package:flutter/material.dart';

class AppNavigation{

  void goBack(BuildContext context){
    Navigator.pop(context);
  }
  void pushTo(BuildContext context, Widget screen){
     Navigator.push(context,MaterialPageRoute(builder:(context)=>screen));
  }

}