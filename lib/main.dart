import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tikare/firebase_options.dart';
import 'package:tikare/screens/prelogin.dart';
import 'package:tikare/screens/splash.dart';
import 'package:tikare/screens/verify.dart';
import 'package:tikare/services/firebase/push_notification.dart';
import 'package:tikare/utils/app_colors.dart';
import 'package:tikare/utils/app_strings.dart';
import 'package:tikare/utils/helper..dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await PushNotification.initialize();
  await PushNotification.getDeviceToken();
  final deviceType = getDeviceType();
  await Helper.saveDeviceType(deviceType);
  runApp(const MyApp());
}
 String getDeviceType() {
    if (kIsWeb) return 'Web';
    if (Platform.isAndroid) return 'Android';
    if (Platform.isIOS) return 'iOS';
    return 'Unknown';
  }
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme:ThemeData(
        scaffoldBackgroundColor: AppColors.appMainColor
      ),
      home: SplashScreen()
      
    );
  }
}




