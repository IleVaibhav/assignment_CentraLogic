/*
1. Create a new Flutter project.
2. Design a UI similar to the Facebook login page, including:
    Facebook logo at the top.
    Text fields for email/phone and password.
    "Forgot Password?" text.
    "Log In" button.
    "Create New Account" button.
 */

import 'package:fb_login/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FBLogin(),
    );
  }
}