import 'package:ar_furniture_app/onboarding_page.dart';
import 'package:ar_furniture_app/page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ConcentricAnimationOnboarding(),
  ));
}
