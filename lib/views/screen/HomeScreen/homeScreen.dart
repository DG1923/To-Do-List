import 'package:flutter/material.dart';
import 'taskScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: SafeArea(child: Taskscreen()),
    );
  }
}