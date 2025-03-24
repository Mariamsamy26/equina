import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth/auth_screen.dart';
import 'home/home_screen.dart';
import 'profile/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: HomeScreen.routeName,
          routes: {
            AuthScreen.routeName: (context) => AuthScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            ProfileScreen.routeName: (context) => ProfileScreen(),
          },
        );
      },
    );
  }
}
