import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget{
  final Widget child;
  final double? margin;
  const CustomContainer({super.key,required this.child,this.margin});
  @override
  Widget build(BuildContext context){
    return Container(
      width:MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height,
      margin:margin!=null ? EdgeInsets.all(margin!) : null,
      child:child
    );
  }
}