



import 'package:lyrics/Taieb/hard.dart';
import 'package:lyrics/Taieb/provider/game_state.dart';
import 'package:lyrics/Taieb/provider/mission_provider8.dart';
import 'package:lyrics/Taieb/screen/widgets/line_divider.dart';
import 'package:lyrics/Taieb/screen/widgets/tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../main.dart';
import '../model/node_model.dart';


class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin{

  List<NoteModel>  notes = mission9();
  late AnimationController _animationController;
  int currentNoteIndex=3;
  final player = AudioPlayer();
  AudioPlayer audioPlayer= AudioPlayer();
  AudioPlayer click=AudioPlayer();
  AudioPlayer goodjob = AudioPlayer();
  AudioPlayer epic = AudioPlayer();
  int point =0;
  bool hasGameStarted = false;
  bool isPlaying = true;
  final List<String> lisss = [
    '6','12','18','24','30','36','42','48','54','60',
  ];

  void play() async{
    await audioPlayer.play(AssetSource("5morehours.mp3"));
  }
  void play_1() async{
    await click.play(AssetSource("click.mp3"));
  }
  void play_3() async{
    await goodjob.play(AssetSource("goodjob.mp3"));
  }
  void play_4() async{
    await epic.play(AssetSource("epic.mp3"));
  }



  @override


  void initState(){
    _animationController=AnimationController(vsync: this,duration:Duration(milliseconds:1100));
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && isPlaying) {

        if ((notes[currentNoteIndex+3].noteState != NoteState.TappedState) && lisss.contains(notes[currentNoteIndex+3].txt)  ){

          setState(() {
            isPlaying = false;
            notes[currentNoteIndex+3].noteState = NoteState.MissedState;
          });
          play_4();
          _showFinishDialog();
        };
        if ((notes[currentNoteIndex+3].noteState == NoteState.TappedState) && !lisss.contains(notes[currentNoteIndex+3].txt)  ){

          setState(() {
            isPlaying = false;
            notes[currentNoteIndex+3].noteState = NoteState.MissedState;
          });
          play_4();
          _showFinishDialog();
        };
        if (currentNoteIndex == notes.length - 5) {
          play_3();
          _showFinishDialog();
        } else {
          setState(() {
            currentNoteIndex++;

          });
          _animationController.forward(from: 0);


        }
      }});
    _animationController.forward(from: -1);
    super.initState();


  }

  @override
  void dispose(){
    super.dispose();
    _animationController.dispose();

  }
  void _showFinishDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: InkWell(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>SpacerWidget2()));
              audioPlayer.stop();
              epic.stop();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(150)),
                  ),
                  child: Icon(Icons.play_arrow, size: 50),

                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(150)),
                  ),
                  child: Text(
                    "Score: $point/16",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                _starWidget(),
              ],
            ),
          ),
        );
      },
    ).then((_) => _restart());
  }
  void _restart() {
    setState(() {
      hasGameStarted = false;
      isPlaying = true;
      notes = mission9();
      point = 0;
      currentNoteIndex = 0;
      _animationController.duration = Duration(milliseconds: 1000);
    });
    _animationController.reset();
  }
  Widget _starWidget() {
    if (point >= 8 && point <12)
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            color: Colors.deepOrange,
          ),
          Icon(
            Icons.star,
            color: Colors.green,
          ),
          Icon(
            Icons.star,
            color: Colors.green,
          ),
        ],
      );
    else if (point >= 12 && point <16)
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            color: Colors.deepOrange,
          ),
          Icon(
            Icons.star,
            color: Colors.deepOrange,
          ),
          Icon(
            Icons.star,
            color: Colors.green,
          ),
        ],
      );
    else if (point >= 16)
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            color: Colors.deepOrange,
          ),
          Icon(
            Icons.star,
            color: Colors.deepOrange,
          ),
          Icon(
            Icons.star,
            color: Colors.deepOrange,
          ),
        ],
      );
    else
      return Container();
  }

  Widget build(BuildContext context) {
    if(isPlaying){
      play();
    }else{
      audioPlayer.stop();
    }
    return Scaffold(
      body: Container(
          child:Stack(
              fit:StackFit.passthrough,
              children:[
                Container(
                  height: double.infinity,
                  child: Image.asset("assets/back5.gif",fit: BoxFit.cover,),
                ),
                Row(
                  children: [
                    drawLineWidget(0),
                    LineDivider(),
                    drawLineWidget(1),
                    LineDivider(),
                    drawLineWidget(2),
                    LineDivider(),
                    drawLineWidget(3),


                  ],
                ),
                _drawPoint(),
                _drawCompleteTile(),
              ]
          )
      ),
    );
  }
  Widget drawLineWidget(int lineNumber){
    return Expanded(


      child: LineWidget( lineNumber,  notes.sublist(currentNoteIndex,currentNoteIndex+6),_animationController,(NoteModel note){
        setState(() {
          note.noteState =NoteState.TappedState;
          click.stop();
          play_1();
          if (point==5||point==12||point==15||point==20||point==25){
            play_3();
          }
          ++point;

        }); }),


    );

  }
  _drawPoint(){
    return Align(
      alignment:Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top:40.0),
        child: Text(
          "$point",style: TextStyle(color: Colors.red,fontSize: 60),
        ),
      ),
    );
  }
  Widget _drawCompleteTile() {
    return Positioned(
      top: 25,
      right: 50,
      left: 50,
      child: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _tileWidget(Icons.star,
              color: point >= 8 ? Colors.deepOrange : Colors.green),
          _tileHorizontalLine(
              point >= 12 ? Colors.green : Colors.deepOrange),
          _tileWidget(Icons.star,
              color: point >= 12 ? Colors.deepOrange : Colors.green),
          _tileHorizontalLine(
            point >= 16 ? Colors.green : Colors.deepOrange,),
          _tileWidget(Icons.star,
              color: point >= 16 ? Colors.deepOrange : Colors.green),
        ]),
      ),
    );
  }
  _tileWidget(IconData icon, {required Color color}) {
    return Container(
      child: Icon(
        icon,
        color: color,
      ),
    );
  }

  _tileHorizontalLine(Color color) {
    return Container(
      width: 80,
      height: 4,
      color: color,
    );
  }
  _playNote(NoteModel note) {
    switch (note.line) {
      case 0:
        player.play(UrlSource('A.mp3'));
        return;
      case 1:
        player.play(UrlSource('A.mp3'));
        return;
      case 2:
        player.play(UrlSource('A.mp3'));
        return;
      case 3:
        player.play(UrlSource('A.mp3'));
        return;
    }
  }



}
