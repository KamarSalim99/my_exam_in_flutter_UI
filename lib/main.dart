import 'package:exam2_at_flutterui/core/get_it.dart';
import 'package:exam2_at_flutterui/view/login_screen.dart';
import 'package:exam2_at_flutterui/view/onboarding_screen.dart';
import 'package:exam2_at_flutterui/view/people_screen.dart';
import 'package:flutter/material.dart';

void main() {
  //setup();
  runApp(const MyApp());
}
PageController onBoardingContoller=PageController();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          //body:  OnboardingScreen(),
          body: PageView(
              controller: onBoardingContoller,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                OnboardingScreen(),
                LogInScreen(),
                PeopleScreen(),
              ]),
        ));
  }
}
