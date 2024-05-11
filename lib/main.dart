/*
Requirements:
  1. The app should have a home page displaying a list of products.
  2. Each product should have a name, price, image
  3. When a ListTile is clicked, navigate to a new page that displays the name and image of the clicked item.
  4. Also add a back button to the second screen

Bonus:
  Customize the appearance of the list and the new page
 */

import 'package:assignment_2/splash_screen.dart';
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
      home: const SplashScreen(),
    );
  }
}