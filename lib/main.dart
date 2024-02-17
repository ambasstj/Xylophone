import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: const Text('Xylophone'),
          ),
          body: const SafeArea(child: XyloPage()),
        ),
      ),
    );

class XyloPage extends StatelessWidget {
  const XyloPage({super.key});

  void playSound(int noteNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$noteNumber.wav'));
  }

  Widget xyloKey(int noteNumber, Color color) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          playSound(noteNumber);
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<ContinuousRectangleBorder>(
                const ContinuousRectangleBorder()),
            backgroundColor: MaterialStateProperty.all(color)),
        child: const Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        xyloKey(1, Colors.blue),
        xyloKey(2, Colors.brown),
        xyloKey(3, Colors.yellow),
        xyloKey(4, Colors.green),
        xyloKey(5, Colors.purple),
        xyloKey(6, Colors.red),
        xyloKey(7, Colors.black),
      ],
    );
  }
}
