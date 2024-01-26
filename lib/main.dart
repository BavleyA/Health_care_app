import 'package:flutter/material.dart';
import 'package:heath_care_test/screens/home.dart';
//import 'package:flutter_app/firebase_options.dart';
import 'package:heath_care_test/screens/splashScreen.dart';
//import 'package:firebase_core/firebase_core.dart';
main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}