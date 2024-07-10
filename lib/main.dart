import 'package:flutter/material.dart';
import 'package:kabar_app/domain/utils/app_colors.dart';
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

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary_Color),
        useMaterial3: true,
      ),
   /*   themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),*/
      initialRoute: AppRoutes.SPLASH_PAGE,
      routes: AppRoutes.routesMap(),
    );
  }
}
