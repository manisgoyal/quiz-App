import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function()? restartQuiz;
  Result(this.resultScore, this.restartQuiz);
  String get finalResult {
    String rsltMsg;
    if (resultScore <= 30) {
      rsltMsg = 'You were good, kiddo!!';
    } else if (resultScore <= 50) {
      rsltMsg = "Now, the game's on!!";
    } else {
      rsltMsg = "You're awesome!!";
    }
    return rsltMsg;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          finalResult,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        TextButton(
            onPressed: restartQuiz,
            child: const Text('Restart Quiz'),
            style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.blueGrey[900]),foregroundColor: MaterialStateProperty.all(Colors.blueGrey)))
      ],
    ));
  }
}
