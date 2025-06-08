import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:tikare/firebase_options.dart';
import 'package:tikare/screens/master.dart';
import 'package:tikare/services/firebase/push_notification.dart';
import 'package:tikare/utils/app_strings.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await PushNotification.initialize();
  await PushNotification.getDeviceToken();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      home: Scaffold(
        body:Center(child:Text("Welcome"))
      ),
    );
  }
}




