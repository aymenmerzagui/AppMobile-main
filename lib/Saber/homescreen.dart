  import 'count_down.dart';
  import 'package:flutter/material.dart';
  import 'ItemModel.dart';
  import 'Easy.dart';
  import 'ItemModel.dart';



  class HomeScreen extends StatefulWidget {

    double x;
    double y;
    List items;
  /*  const HomeScreen({Key? key}) : super(key: key);*/
    HomeScreen(this.y,this.x,this.items);
    @override
    State<HomeScreen> createState() => _HomeScreenState();


  }

  class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

    late AnimationController _controller;
    final int limitTime=60;


    late List<ItemModel> items2;
    late int score;
    late bool gameover;

    late List<ItemModel> items1=List.from(widget.items);

    initGame(){
      gameover=false;
      score=0;

      items2=List.from(widget.items);
      widget.items.shuffle();
      items2.shuffle();
    }
    @override
    void dispose() {
      // TODO: implement dispose

      if(_controller.isAnimating || _controller.isCompleted) {
        _controller.dispose();
      }
      super.dispose();
    }
    @override
    void initState(){
    super.initState();
    initGame();
    _controller=AnimationController(
        vsync: this,duration: Duration(seconds: limitTime)
    );
    _controller.addListener(() {
      if(_controller.isCompleted){
        Navigator.pop(context);
        Navigator.pushNamed(context, "routeName");

      }
    });
    _controller.forward();
    }



    @override
    Widget build(BuildContext context) {
      if(items1.isEmpty) gameover=true;

      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(

              children:  [
                Row(
                  children: [
                    Countdown(
                        animation: StepTween(
                            begin: limitTime,
                            end: 0)
                            .animate(_controller)),
                    Spacer(),
                    Spacer(),
                    Padding(
                    padding: EdgeInsets.all(15.0),
                    child:Text.rich(
                        TextSpan(
                            children: [

                              TextSpan(
                                text: 'Score:',
                                style: Theme.of(context).textTheme.subtitle1,

                              ),
                              TextSpan(
                                text: '$score',
                                style: Theme.of(context)
                                    .textTheme.headline2?.copyWith(color: Colors.teal),
                              )
                            ]
                        )
                    ),
                  ),
                  ],
                ),


              /*Spacer(),*/

                if(!gameover)
                SizedBox(width: 20,),
                  Row(
                    children: [

                      Spacer(),
                      Column(
                        children: items1.map((item){
                          return Container(
                            margin: EdgeInsets.all(8),
                            child: Draggable<ItemModel>(
                              data: item,
                              childWhenDragging: Container(
                                height: widget.x,
                                width: widget.x,
                                child: Image.asset(item.img),
                              ),
                              feedback: Container(

                                height: widget.x,
                                width: widget.x,

                                  child: Image.asset(item.img),

                              ),
                              child:Container(

                                  height: widget.x,
                                  width: widget.x,
                                child: Image.asset(item.img),
                               ),
                            ),
                          );
                        }).toList(),
                      ),
                      Spacer(),
                      Spacer(),

                      Column(
                        children:
                          items2.map((item){

                            return DragTarget<ItemModel>(
                              onAccept: (recivedItem){//t9bell taswira m3a esmha
                                if(item.value==recivedItem.value){
                                  setState(() {
                                    //recivedItem houa taswirra
                                    items1.remove(recivedItem);
                                    items2.remove(item);
                                  });
                                  score+=10;
                                  item.accepting=false;

                                }else{
                                  setState(() {
                                    score-=5;
                                    item.accepting=false;
                                  });
                                }
                              },
                              //check in where am i???
                              onWillAccept: (recivedItem){
                                setState(() {
                                  item.accepting=true;
                                });
                                return true;
                              },
                              onLeave: (recivedItem){
                                setState(() {
                                  item.accepting=false;
                                });

                              },
                              builder: (context,acceptedItem,rejectedItem)=>
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: item.accepting
                                        ?Colors.grey[400]
                                        :Colors.grey[200],
                                    ),
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.width/6.5,
                                    width:MediaQuery.of(context).size.width/3,
                                    margin: EdgeInsets.all(widget.y),
                                    child:Text(
                                      item.name,
                                      style:Theme.of(context).textTheme.headline6,
                                    )
                                  ),

                            );
                          }).toList(),

                      ),
                      Spacer()
                    ],
                  ),
                if(gameover)
                  Center(
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                        child:Text(
                          'Game Over',
                          style:Theme.of(context).textTheme.headline6?.copyWith(
                              fontWeight:FontWeight.bold,color:Colors.red ) ,
                        ),
                        ),
                      ],
                    ),
                  ),
                if(gameover)
                  Container(
                    height: MediaQuery.of(context).size.width/10,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                      onPressed: (){
                          setState(() {
                            initGame();
                          });
                        Navigator.pop(context);

                      },
                      child: Text(
                        'New Game',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
              ],
            ),
          ),

        ),
      );
    }
  }
