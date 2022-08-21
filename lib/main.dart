import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prompt.dart';
import 'control.dart';
import 'score.dart';
import 'game_model.dart';
import 'dart:math';

void main() {
  runApp(const BullsEyeApp());
}

class BullsEyeApp extends StatelessWidget {
  const BullsEyeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'Bullseye',
      home: const GamePage(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.amber[100]),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late GameModel _model;

  @override
  void initState() {
    super.initState();
    _model = GameModel(50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Prompt(targetValue: _model.target),
            Control(
              model: _model,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _showAlertVisible(context);
                  _model.round += 1;
                  _model.hitTheTarget();
                  _model.target = Random().nextInt(100);
                });
              },
              child:
                  const Text("Hit me!", style: TextStyle(color: Colors.blue)),
            ),
            Score(model: _model),
          ],
        ),
      ),
    );
  }

  void _showAlertVisible(BuildContext context) {
    var okButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text("Awesome!"),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Hello there!"),
          content: Text("The slider's value is: ${_model.current}"),
          actions: [
            okButton,
          ],
          elevation: 5,
        );
      },
    );
  }
}
