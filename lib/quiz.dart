import 'package:flutter/material.dart';
import 'package:secondapp/result_screen.dart';
import 'package:secondapp/start_screen.dart';
import 'package:secondapp/questions_screen.dart';
import 'package:secondapp/questions/questions.dart';
import 'package:secondapp/colors/dark_theme.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

  var activeScreen = 'start-screen';

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question-screen';
    });
  }

  void screenChange() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(screenChange);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(selectedAnswer, restartQuiz);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              darkTheme.background,
              darkTheme.background,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
