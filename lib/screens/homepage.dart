import 'package:flutter/material.dart';
import '../helper/dbhelper.dart';
import '../modules/modul.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future getData;


  void initState() {
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        leading: Icon(Icons.menu,color: Colors.black,size: 30,),

      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(15),
        children: Animaldata.animallist
            .map(
              (e) => GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                "secondpage", arguments: e,);
            },
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 300,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    width: 2,
                  ),
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://source.unsplash.com/random/?$e",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orangeAccent.withOpacity(0.20),
                      offset: const Offset(0, 0),
                      blurRadius: 4,
                      spreadRadius: 3,
                    )
                  ]),
              child: Container(
                alignment: Alignment.center,
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom:  Radius.circular(10),
                  ),
                  color: Colors.black,
                ),
                child: Text(
                  "$e Animal",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        )
            .toList(),
      ),
      backgroundColor: const Color(0xffEDEDED),
    );
  }
}
