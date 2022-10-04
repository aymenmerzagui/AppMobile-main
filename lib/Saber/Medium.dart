

import 'Litses.dart';

import 'homescreen.dart';
import 'package:flutter/material.dart';

class Medium extends StatefulWidget {
  /*const ListScreen({Key? key}) : super(key: key);*/
  double x,y;

  Medium(this.y,this.x);

  @override
  State<Medium> createState() => _MediumState();
}





class _MediumState extends State<Medium> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(



        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,



            children: [


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
                      MaterialPageRoute(builder: (context)=>HomeScreen(widget.y,widget.x,Listes.carnivores_animals.sublist(6,7))),
                    );
                    Listes.carnivores_animals.shuffle();

                  },
                  child: const Text(
                    "carnivores animals",
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
                      MaterialPageRoute(builder: (context)=>HomeScreen(widget.y,widget.x,Listes.herbivores_animals.sublist(1,5))),
                    );
                    Listes.herbivores_animals.shuffle();
                  },
                  child: const Text(
                    "herbivores animals",
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
                      MaterialPageRoute(builder: (context)=>HomeScreen(widget.y,widget.x, Listes.omnivores_animals.sublist(1,5))),
                    );
                    Listes.omnivores_animals.shuffle();
                  },
                  child: const Text(
                    "omnivores animals",
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
                        MaterialPageRoute(builder: (context)=> HomeScreen(widget.y,widget.x, Listes.Fruit.sublist(1,5)))
                    );
                    Listes.Fruit.shuffle();
                  },
                  child: const Text(
                    "Fruits",
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
                        MaterialPageRoute(builder: (context)=> HomeScreen(widget.y,widget.x, Listes.vegetable.sublist(1,5)))
                    );
                    Listes.vegetable.shuffle();
                  },
                  child: const Text(
                    "vegetables",
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
                        MaterialPageRoute(builder: (context)=> HomeScreen(widget.y,widget.x, Listes.Aquatic_Animals.sublist(1,5)))
                    );
                    Listes.Aquatic_Animals.shuffle();
                  },
                  child: const Text(
                    "Aquatic Animals",
                    style: TextStyle(
                      fontSize:25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],

          ),



        )
    );
  }
}
