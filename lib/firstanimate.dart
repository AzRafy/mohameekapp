import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showImage = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: FadeIn(
              duration: const Duration(seconds: 2),
              delay: Durations.extralong4,
              curve: Curves.linear,
              animate: true,
              child: Image.asset(
                'assets/images/logo_red.png',
                width: 200,
              ),
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 40,
            child: Text(
              'Developed by Smart Five Technologies',
              style: TextStyle(
                color: Color(0xff6C6C6C),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
