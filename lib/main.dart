import 'package:flutter/material.dart';
import 'package:update_login_screen/login.dart';
import 'package:update_login_screen/share/comp.dart';
import 'package:update_login_screen/animated_list.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const updateLoginScreen(),
    );
  }
}