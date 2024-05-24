import 'package:assignment_3_provider/authentication/provider/auth_provider.dart';
import 'package:assignment_3_provider/home/provider/data_provider.dart';
import 'package:assignment_3_provider/splash_screen.dart';
import 'package:assignment_3_provider/home/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterProvider()
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider()
        ),
        ChangeNotifierProvider(
          create: (_) => BookDataProvider()
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true
        ),
        home: const SplashScreen()
      )
    );
  }
}