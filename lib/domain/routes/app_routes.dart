import 'package:flutter/material.dart';
import 'package:kabar_app/presentation/pages/details.dart';
import 'package:kabar_app/presentation/pages/home.dart';
import 'package:kabar_app/presentation/pages/onboard.dart';
import 'package:kabar_app/presentation/pages/signin.dart';
import 'package:kabar_app/presentation/pages/signup.dart';
import 'package:kabar_app/presentation/pages/splash.dart';

class AppRoutes {
  static const String SPLASH_PAGE = '/';
  static const String ONBOARD_PAGE = '/onboard';
  static const String SIGNIN_PAGE = '/signIn';
  static const String SIGNUP_PAGE = '/signup';
  static const String HOME_PAGE = '/home';
  static const String DETAIL_PAGE = '/detail';

  static Map<String, Widget Function(BuildContext)> routesMap() => {
        AppRoutes.SPLASH_PAGE: (context) => SplashPage(),
        AppRoutes.ONBOARD_PAGE: (context) => const OnBoardingPage(),
        AppRoutes.SIGNIN_PAGE: (context) => SignInPage(),
        AppRoutes.SIGNUP_PAGE: (context) => SignUpPage(),
        AppRoutes.HOME_PAGE: (context) => HomePage(),
        AppRoutes.DETAIL_PAGE: (context) =>  NewsDetail(),
      };
}
