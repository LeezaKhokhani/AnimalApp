import 'package:flutter/material.dart';
import '../helper/dbhelper.dart';
import '../modules/modul.dart';

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("$data",style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder(
        future: DBHelper.dbHelper.fetchAllData(type: '$data'),
        builder: (BuildContext context, AsyncSnapshot<List<Animal>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}",style: TextStyle(color: Colors.redAccent),),
            );
          } else if (snapshot.hasData) {
            List<Animal>? AnimalsList = snapshot.data;
            return Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://source.unsplash.com/random/?$data",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: AnimalsList!
                        .map((e) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: h * 0.4,
                        width: w * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: h * 0.20,
                              width: w,
                              decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    e.image,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.name,
                                    style:  TextStyle(
                                      fontSize: 18,
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    e.description,
                                    style:  TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                        .toList(),
                  ),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: Colors.black,),
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}