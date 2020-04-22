import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int _leftNumber = 1;
  int _rightNumber = 6;

  Random rnd = new Random();
  int min = 1;
  int max = 6;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Row(
          children: [
            expandedImage(_leftNumber, 'L'),
            expandedImage(_rightNumber, 'R'),
          ],
        ),
      ),
    );
  }

  Expanded expandedImage(int image, String which) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          setState(() {
            _leftNumber = min + rnd.nextInt(max - min);
            _rightNumber = Random().nextInt(6) + 1;
          });
//          d.log('data:$_leftNumber & $_rightNumber - $which clicked');
        },
        child: Image.asset('images/dice' + image.toString() + '.png'),
      ),
    );
  }
}
