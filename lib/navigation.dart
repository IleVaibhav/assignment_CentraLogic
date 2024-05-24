
import 'package:assignment_3_provider/cart/cart_screen.dart';
import 'package:assignment_3_provider/customs/common_data.dart';
import 'package:flutter/material.dart';

import 'home/screens/home.dart';
import 'other_screens.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {

  int currentPageIndex = 0;
  final navigationScreens = [
    const HomeScreen(),
    const OtherScreen(title: 'Category'),
    const CartScreen(),
    const OtherScreen(title: 'Profile')
  ];
  final navigationScreensName = [
    'Home', 'Category', 'Cart', 'Profile'
  ];
  final navigationScreensIcon = [
    (Icons.home), (Icons.category),
    (Icons.shopping_bag), (Icons.man)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationScreens[currentPageIndex],
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            navigationScreens.length, 
            (index) => InkWell(
              onTap: () {
                setState(() {
                  currentPageIndex = index;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    navigationScreensIcon[index],
                    size: 25,
                    color: currentPageIndex == index ? CommonData.customBlue : CommonData.textGrey,
                  ),
                    
                  const SizedBox(
                    height: 5,
                    width: 0
                  ),
                  Text(
                    navigationScreensName[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: currentPageIndex == index ? FontWeight.w500 : FontWeight.w400,
                      color: currentPageIndex == index ? CommonData.customBlue : CommonData.textGrey
                    )
                  ),
                ],
              )
            )
          )
        ),
      )
    );
  }
}