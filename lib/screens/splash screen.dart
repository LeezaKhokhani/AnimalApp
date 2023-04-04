import 'package:dbminer1/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

  logicIntro() async {
    final prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    logicIntro();
    Future.delayed(
      const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomePage())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Container(
              height: 900,
              width: 900,
              child: Image.asset("aseets/images/elephant.jpg",fit: BoxFit.cover,)),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height: 400,
                ),
                Text("Ready to ",style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.w500),),
                SizedBox(
                  height: 10,
                ),
                Text("Watch",style: TextStyle(fontWeight:FontWeight.w800,color: Colors.white,fontSize: 55),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}