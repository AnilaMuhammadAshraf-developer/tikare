import 'package:flutter/material.dart';


class ChatScreen extends StatefulWidget{
  const ChatScreen({super.key});
  @override
  _ChatScreenState createState()=>_ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>{
  @override
Widget build(BuildContext context){
  return Center(
    child:Text("Chat Screen Hai")
  );
}
}
