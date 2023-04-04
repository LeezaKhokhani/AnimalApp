import 'package:flutter/material.dart';
import 'package:dbminer1/screens/homepage.dart';
import 'package:dbminer1/screens/secondpage.dart';
import 'package:dbminer1/screens/splash%20screen.dart';



void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),

      routes: {
        '/': (context) => const splash_screen(),
        'home_page' : (context) => HomePage(),
        'secondpage' : (context) => secondpage(),
      },
    ),
  );
}


