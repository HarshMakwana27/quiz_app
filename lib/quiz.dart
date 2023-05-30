import 'package:flutter/material.dart';
import 'package:secondapp/start_screen.dart';
import 'package:secondapp/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  void screenChange() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(screenChange);

    if (activeScreen == 'question-screen') {
      screenWidget = const QuestionsScreen();
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 73, 112, 149),
              Color.fromARGB(255, 85, 147, 174),
            ], begin: Alignment.topRight, end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
