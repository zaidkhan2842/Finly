import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_login_sign_up/login_sign.dart';
import 'package:flutter_application_1/landing_page_flnly/landing.dart';
import 'package:flutter_application_1/page/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(body: SplashScreen()),
      debugShowCheckedModeBanner: false,
      initialRoute: '/onboarding',
      routes: {
        '/login_page': (context) => const LoginPage(),
        '/Home_apk': (context) => const FinanceApp(),
      },
    );
  }
}
