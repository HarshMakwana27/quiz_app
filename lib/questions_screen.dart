import 'package:flutter/material.dart';
import 'package:secondapp/answer_button.dart';
import 'package:secondapp/colors/dark_theme.dart';
import 'package:secondapp/questions/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionNumber = 0;

  void changeQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionNumber++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionNumber];

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              currentQuestion.text,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: darkTheme.onBackground,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          ...currentQuestion.getShuffledAnswers().map(
            (answer) {
              return AnswerButton(answer, () {
                changeQuestion(answer);
              });
            },
          ),
        ],
      ),
    );
  }
}
