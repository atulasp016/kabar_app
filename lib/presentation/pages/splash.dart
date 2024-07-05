import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kabar_app/domain/routes/app_routes.dart';
import 'package:kabar_app/domain/utils/app_images.dart';

class SplashPage extends StatefulWidget {


  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
   @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.HOME_PAGE);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double mWidth = MediaQuery.of(context).size.width;
    final double mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        SizedBox(height: mHeight * 0.5 - 65),
        Image.asset(AppImages.IC_APP_LOGO,
            height: 65, width: 210, fit: BoxFit.fill),
      ],
    )));
  }
}
