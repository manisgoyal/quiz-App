import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favorite colour?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 12},
        {'text': 'Green', 'score': 14},
        {'text': 'Yellow', 'score': 16},
      ],
    },
    {
      'questionText': 'What is your favorite language?',
      'answers': [
        {'text': 'Python', 'score': 10},
        {'text': 'C++', 'score': 12},
        {'text': 'JS', 'score': 14},
        {'text': 'Dart', 'score': 16},
      ],
    },
    {
      'questionText': 'Which one is your pet?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 12},
        {'text': 'Rabbit', 'score': 16},
      ],
    },
  ];

  var _quesIndex = 0;
  var _totalScore = 0;
  void _restartQuiz() {
    setState(() {
      _totalScore = 0;
      _quesIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _quesIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _quesIndex < _questions.length
            ? Quiz(
                quesIndex: _quesIndex,
                questions: _questions,
                answerQuestion: _answerQuestion)
            : Result(_totalScore,_restartQuiz),
      ),
    );
  }
}
