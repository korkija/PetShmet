import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pet_shmet/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset('assets/animation/Animation_2.json'),
          ),
        ],
      ),
      nextScreen: const LoginScreen(),
      splashIconSize: 400,
      backgroundColor: const Color.fromARGB(255, 107, 159, 248),
    );
  }
}
