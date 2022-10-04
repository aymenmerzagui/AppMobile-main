import 'Easy.dart';
import 'package:flutter/material.dart';

import 'Hard.dart';
import 'Medium.dart';
class difficulty extends StatefulWidget {
  const difficulty({Key? key}) : super(key: key);

  @override
  State<difficulty> createState() => _difficultyState();
}

class _difficultyState extends State<difficulty> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5),
      body :Column(
        children:[
          /*Text(
             'I continue to believe that if children are given'
                'the necessary tools to succesed,they will'
                'will succeed beyond their wildset dreeams ',
            *//*style: ,*//*

          ),*/

          const SizedBox(
            height: 150,
          ),
          Container(
            height: 60,
            width:double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: const LinearGradient(colors:[Colors.blue, Colors.blueGrey]),
            ),
            child: MaterialButton(
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Easy(35,120)),
                );
              },
              child: const Text(
                "Easy",
                style: TextStyle(
                  fontSize:25,
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
            width:double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: const LinearGradient(colors:[Colors.blue, Colors.blueGrey]),
            ),
            child: MaterialButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Medium(20,80) )
                );
              },
              child: const Text(
                "Medium",
                style: TextStyle(
                  fontSize:25,
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
            width:double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: const LinearGradient(colors:[Colors.blue, Colors.blueGrey]),
            ),
            child: MaterialButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Hard(15,70) )
                );
              },
              child: const Text(
                "Hard",
                style: TextStyle(
                  fontSize:25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],

      ),




    );
  }
}
