import 'package:assignment_3_provider/customs/common_data.dart';
import 'package:flutter/material.dart';

class OtherScreen extends StatelessWidget {
  final String title;
  const OtherScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: CommonData.textBlack
          )
        )
      ),
      body: Center(
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: CommonData.customBlue,
            fontSize: 25
          )
        )
      ),
    );
  }
}