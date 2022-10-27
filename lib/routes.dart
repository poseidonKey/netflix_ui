import 'package:flutter/material.dart';
import 'package:netflix_ui/screens/deatil/detail_screen.dart';
import 'package:netflix_ui/screens/main_screens.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  MainScreens.routeName: (context) => const MainScreens(),
  DetailScreen.routeName: (context) => const DetailScreen(),
};
