import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final int quesIndex;
  final List<Map<String, Object>> questions;
  final Function(int) answerQuestion;

  Quiz({
    required this.quesIndex,
    required this.questions,
    required this.answerQuestion,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[quesIndex]["questionText"] as String
            // Dart can't directly tell that it always gives a string,
            // so to avoid error. Same done while mapping for List<String>
            ),
        ...(questions[quesIndex]['answers'] as List<Map<String,dynamic>>).map((answer) {
          return Answer(()=>answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
