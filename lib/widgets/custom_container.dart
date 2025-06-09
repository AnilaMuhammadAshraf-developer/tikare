import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget{
  final Widget child;
  const CustomContainer({super.key,required this.child});
  @override
  Widget build(BuildContext context){
    return Container(
      width:MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height,
      child:child
    );
  }
}