import 'package:flutter/material.dart';


class MasterScreen extends StatefulWidget{
  final String? fcmToken;
  const MasterScreen({super.key, required this.fcmToken});
  @override
  _MasterScreenState createState()=>_MasterScreenState();
}
class _MasterScreenState extends  State<MasterScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
       body:Center(
        child:SelectableText('${widget.fcmToken ?? "No Token"}'),
       )
    );
  }
}