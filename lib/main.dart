import 'dart:math';

import 'package:discountnearme/ui/root_page.dart';
import 'package:discountnearme/ui/screens/home_page.dart';
import 'package:discountnearme/ui/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'API/AppConstants.dart';
import 'ui/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkSession(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading screen while waiting for the session check
          return const CircularProgressIndicator();
        } else {
          bool hasSession = snapshot.data ?? false;
          return MaterialApp(
            title: 'Onboarding Screen',
            home: hasSession ? const RootPage() : const OnboardingScreen(),
            debugShowCheckedModeBanner: false,
          );
        }
      },
    );
  }

  Future<bool> checkSession() async {
    AppConstants.prefs = await SharedPreferences.getInstance();
    return AppConstants.prefs?.getBool("session") ?? false;
  }
}

