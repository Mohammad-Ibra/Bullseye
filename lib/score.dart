import 'package:flutter/material.dart';
import 'game_model.dart';

class Score extends StatefulWidget {
  const Score({Key? key, required this.model}) : super(key: key);

  final GameModel model;

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {
            setState(() {
              widget.model.startOver();
            });
          },
          child: const Text("Start Over"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              const Text("Score: "),
              Text("${widget.model.totalScore}"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              const Text("Round: "),
              Text('${widget.model.round}'),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            _showInfoVisible(context, widget.model);
          },
          child: const Text("Info"),
        ),
      ],
    );
  }

  void _showInfoVisible(BuildContext context, model) {
    var okButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text("Ok!"),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Info!"),
          content: Column(
            children: [
              Text("The slider's value is: ${model.current}"),
              Text("The Current score is: ${model.totalScore}")
            ],
          ),
          actions: [
            okButton,
          ],
          elevation: 5,
        );
      },
    );
  }
}
