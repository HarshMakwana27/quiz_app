import 'package:flutter/material.dart';
import 'package:secondapp/answer_button.dart';
import 'package:secondapp/questions/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionNumber = 0;

  void changeQuestion() {
    setState(() {
      currentQuestionNumber = currentQuestionNumber + 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionNumber];

    return Center(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(answer, changeQuestion);
              },
            ),
          ],
        ),
      ),
    );
  }
}
