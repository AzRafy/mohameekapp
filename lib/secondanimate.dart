import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mohameekapp/slider.dart';

class Secondanimate extends StatefulWidget {
  const Secondanimate({super.key});

  @override
  State<Secondanimate> createState() => _SecondanimateState();
}

class _SecondanimateState extends State<Secondanimate> {
  bool showImage = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          showImage = false;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SliderScreen(),
            ),
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
            ),
            child: Stack(children: [
              Center(
                child: AnimatedOpacity(
                  opacity: showImage ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset(
                    'assets/images/logo_white.png',
                    width: 200,
                  ),
                ),
              ),
              const Positioned(
                bottom: 20,
                left: 40,
                child: Text(
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  'Developed by Smart Five Technologies',
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
