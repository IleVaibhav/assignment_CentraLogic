import 'dart:async';
import 'package:assignment_2/authentication/login.dart';
import 'package:assignment_2/customs/common_data.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => const LoginScreen())
        ); 
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonData.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            Image.asset(
              'asset/images/logo.png',
              height: 100,
              width: 100
            ),

            const SizedBox(
              height: 5,
              width: 0
            ),

            const Text(
              'BookBank',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.white
              ),
            ),
      
            const SizedBox(height: 8),
      
            const Text(
              'version 1.0.0',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.white
              ),
            ),
      
            const Spacer(),
      
            const Text(
              'V.V',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white
              ),
            ),
            
            const SizedBox(height: 8)
          ]
        ),
      )
    );
  }
}