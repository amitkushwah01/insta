import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instagram/main.dart';

class Splash extends StatefulWidget
{
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),() {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color:Colors.green,
      )
    );
  }
}