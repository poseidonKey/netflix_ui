import 'package:flutter/material.dart';
import '../profile/profile_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      // 1
      Navigator.pushReplacementNamed(context, ProfileScreen.routeName);
    });

    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "MODU's PLAY",
          style: TextStyle(
            color: Colors.red,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
