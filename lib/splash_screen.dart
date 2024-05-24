import 'dart:async';
import 'package:assignment_3_provider/authentication/ui/login.dart';
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
      const Duration(seconds: 2),
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
      backgroundColor: Colors.white,
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

            Text(
              'BookBank',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.blue.shade900
              ),
            ),
      
            const SizedBox(height: 8),
      
            Text(
              'version 1.0.0',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.blue.shade900
              ),
            ),
      
            const Spacer(),
      
            Text(
              'V.V',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue.shade900
              ),
            ),
            
            const SizedBox(height: 8)
          ]
        ),
      )
    );
  }
}