import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tikare/screens/prelogin.dart';
import 'package:tikare/utils/app_assets_path.dart';
import 'package:tikare/utils/app_strings.dart';
import 'package:tikare/widgets/custom_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _scale = 0.8;
  double _opacity = 0.0;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
        _scale = 1.0;
      });
    });
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PreloginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 2),
          child: AnimatedScale(
            scale: _scale,
            duration: Duration(seconds: 2),
           child:Center(
             child:Image.asset(AppAssetsPath.appLogo)
           ),
          ),
        
      ),
    );
  }
}
