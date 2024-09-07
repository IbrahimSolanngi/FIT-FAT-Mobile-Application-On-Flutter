// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfat/screens/home_screen.dart';
import 'package:fitfat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fit Fat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: AnimatedSplashScreen(
            splash:
                Image.asset('assets/images/logo1.png', height: 300, width: 300),
            splashIconSize: 150,
            duration: 3000,
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: Colors.deepPurple,
            // splash: Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Container(
            //         height: 100,
            //         width: 100,
            //         color: Colors.deepPurple,
            //       ),
            //       Container(
            //         child: Text(
            //           'Splash Screen',
            //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            nextScreen: WelcomeScreen()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
