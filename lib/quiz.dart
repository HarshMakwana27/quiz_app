import 'package:flutter/material.dart';
import 'package:secondapp/result_screen.dart';
import 'package:secondapp/start_screen.dart';
import 'package:secondapp/questions_screen.dart';
import 'package:secondapp/questions/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswer = [];

  var activeScreen = 'start-screen';

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
      screenWidget = ResultScreen(selectedAnswer);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 11, 61, 102),
              Color.fromARGB(255, 12, 55, 72),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
