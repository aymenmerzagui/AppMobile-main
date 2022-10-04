  import 'package:flutter/material.dart';

  class Countdown extends AnimatedWidget{
    Countdown({Key? key, required this.animation }):super(key: key, listenable: animation);
    Animation<int> animation;

    @override
    Widget build(BuildContext context) {
      Duration clockTimer=Duration(seconds: animation.value);
      var timeText='${clockTimer.inMinutes.remainder(60).toString()}:'
          '${(clockTimer.inSeconds.remainder(60)%60).toString()
      .padLeft(2,'0')}';
      return Text(
        '${timeText}',
        style: Theme.of(context)
            .textTheme.headline2?.copyWith(color: Colors.teal),
      );
    }
  }