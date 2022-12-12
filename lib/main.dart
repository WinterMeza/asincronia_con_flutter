import 'dart:async';
import 'package:flutter/material.dart';
import 'package:asyncronica/services/mockapi.dart';

Future<void> main() async {
  runApp(const MyApp());
}
const String _title = 'Asynchronous calls-Ronnye Tucker 7mo A';
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  _MyStateAppAsync createState() => _MyStateAppAsync();
}
class _MyStateAppAsync extends State<MyApp> {
  int flash1 = 0; double flash2 = 0; int flash3 = 0; int flash = 0;
  int airport1 = 0; double airport2 = 0; int airport3 = 0; int airport = 0;
  int directions1 = 0; double directions2 = 0; int directions3 = 0; int directions = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Text(_title)),
        backgroundColor: Colors.cyan.shade100,
        body: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  FloatingActionButton(
                    onPressed: () async {
                      setState(() {
                        flash2 = 300; flash3 = 1;
                      });
                      flash = await MockApi().getFerrariInteger();
                      setState(() {
                        flash1 = flash; flash2 = 0; flash3 = 0;
                      });
                      //print(flash3);
                    },
                    backgroundColor: Colors.green,
                    child: const Icon(
                      Icons.flash_on_sharp,
                      //Icons.flash_on,
                      color: Colors.black,
                    ),
                  ),
                  AnimatedContainer(
                    width: flash2,
                    height: 15,
                    decoration: const BoxDecoration(color: Colors.green),
                    duration: Duration(seconds: flash3),
                  ),
                  Text(
                    flash1.toInt().toString(),
                    style: const TextStyle(color: Colors.green, fontSize: 35.0),
                  ),
                ],
              ),
              Column(
                children: [
                  FloatingActionButton(
                      onPressed: () async {
                        setState(() {
                          airport2 = 300; airport3 = 3;
                        });
                        airport = await MockApi().getHyundaiInteger();
                        setState(() {
                          airport1 = airport; airport2 = 0; airport3 = 0;
                        });
                        //print(airport3);
                      },
                      backgroundColor: Colors.orange,
                      child: const Icon(
                        Icons.airport_shuttle,
                        color: Colors.black,
                      )),
                  AnimatedContainer(
                    width: airport2,
                    height: 15,
                    decoration: const BoxDecoration(color: Colors.orange),
                    duration: Duration(seconds: airport3),
                  ),
                  Text(
                    airport1.toInt().toString(),
                    style:
                        const TextStyle(color: Colors.orange, fontSize: 35.0),
                  )
                ],
              ),
              // Botón de
              Column(
                children: [
                  FloatingActionButton(
                      onPressed: () async {
                        setState(() {
                          directions2 = 300; directions3 = 10;
                        });
                        directions = await MockApi().getFisherPriceInteger();
                        setState(() {
                          directions1 = directions; directions2 = 0; directions3 = 0;
                        });
                        // print(directions3);
                      },
                      backgroundColor: Colors.red,
                      child: const Icon(
                        Icons.directions_walk,
                        color: Colors.black,
                      )),
                  AnimatedContainer(
                    width: directions2,
                    height: 15,
                    decoration: const BoxDecoration(color: Colors.red),
                    duration: Duration(seconds: directions3),
                  ),
                  Text(
                    directions1.toInt().toString(),
                    style: const TextStyle(color: Colors.red, fontSize: 35.0),

                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
