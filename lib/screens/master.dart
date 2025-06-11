import 'package:flutter/material.dart';
import 'package:tikare/utils/helper..dart';


class MasterScreen extends StatefulWidget{
  const MasterScreen({super.key});
  @override
  _MasterScreenState createState()=>_MasterScreenState();
}
class _MasterScreenState extends  State<MasterScreen>{
  String? token;
  Future<void> useToken() async{
     String? savedToken=await Helper.getToken();
      setState(() {
      token = savedToken;
    });
  }
  @override 
  void initState(){
    super.initState();
    useToken();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
       body:Center(
        child:token==null ? CircularProgressIndicator() :
        SelectableText(token!),
       )
    );
  }
}