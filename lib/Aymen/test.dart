import 'dart:math';
import 'globals.dart' as global;
import 'package:flutter/material.dart';
import 'package:lyrics/Aymen/list_song.dart';
import 'list_song.dart';

class S1 extends StatefulWidget {
  const S1({Key? key}) : super(key: key);

  @override
  State<S1> createState() => _S1State();
}

class _S1State extends State<S1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          title: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Lyrics",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Center(
            child: Column(children: [
          SizedBox(
            height: 150,
          ),
          Text("Fill The Lyrics",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.blueGrey]),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      global.niveau = Random().nextInt(3) + 3;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => list_song("Easy")),
                      );
                    },
                    child: const Text(
                      "Easy",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.blueGrey]),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      global.niveau = Random().nextInt(2) + 3;

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => list_song("Medium")));
                    },
                    child: const Text(
                      "Medium",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.blueGrey]),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      global.niveau = Random().nextInt(1) + 3;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => list_song("Hard")),
                      );
                    },
                    child: const Text(
                      "Hard",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ])));
  }
}
