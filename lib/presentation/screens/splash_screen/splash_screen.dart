import 'dart:async';
import 'package:flutter/material.dart';
import 'package:music_drift/presentation/screens/bottom_nav/bottom_navbar.dart';
import '../../../widgets/bg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBar(),
        ),
      ),
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: linearGradient(),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/splash_screen_logo.png',
                height: 200,
              ),
              const Text(
                'Music Drift',
                style: TextStyle(
                  fontFamily: 'Iceberg',
                  color: Colors.white,
                  fontSize: 40,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
