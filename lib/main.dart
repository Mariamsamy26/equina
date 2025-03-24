import 'package:equina/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'auth/auth_screen.dart';
import 'home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        AuthScreen.routeName: (c) => AuthScreen(),
        HomeScreen.routeName: (c) => HomeScreen(),
        ProfileScreen.routeName: (c) => ProfileScreen(),
      },
    );
  }
}
