import 'package:flutter/material.dart';
import 'package:kabar_app/domain/utils/app_colors.dart';
import 'package:kabar_app/domain/utils/app_theme.dart';
import 'domain/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kabar App',
      themeMode: ThemeMode.system,
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      initialRoute: AppRoutes.SPLASH_PAGE,
      routes: AppRoutes.routesMap(),
    );
  }
}
