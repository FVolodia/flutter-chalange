import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Udemy course app chalange',
      home: PianoScreen(),
    );
  }
}

class PianoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade800,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade800,
        title: Text(
          'Aria\'s Piano',
          style: TextStyle(fontFamily: "Slackey"),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKeyFun(color: Colors.red, noteName: 'Do', notePosition: 1),
            buildKeyFun(color: Colors.orange, noteName: 'Re', notePosition: 2),
            buildKeyFun(color: Colors.yellow, noteName: 'Mi', notePosition: 3),
            buildKeyFun(color: Colors.green, noteName: 'Fa', notePosition: 4),
            buildKeyFun(color: Colors.teal, noteName: 'Sol', notePosition: 5),
            buildKeyFun(color: Colors.blue, noteName: 'La', notePosition: 6),
            buildKeyFun(color: Colors.purple, noteName: 'Si', notePosition: 7),
          ],
        ),
      ),
    );
  }

  Widget buildKeyFun({Color color, String noteName, int notePosition}) {
    return Expanded(
      child: FlatButton(
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            noteName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontFamily: 'Slackey',
            ),
          ),
        ),
        color: color,
        onPressed: () {
          playNote(notePosition);
        },
      ),
    );
  }

  void playNote(int notePosition) {
    final AudioCache player = AudioCache();
    player.play('/note$notePosition.wav');
  }
}
