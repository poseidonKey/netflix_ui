import 'package:flutter/material.dart';

class MainScreens extends StatefulWidget {
  static String routeName = "/main_screens";

  const MainScreens({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("MainScreens"),
      ),
    );
  }
}
