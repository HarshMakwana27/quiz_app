import 'package:flutter/material.dart';
import 'package:secondapp/colors/dark_theme.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.screenChange, {super.key});

  final void Function() screenChange;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/logoo.png',
            width: 200.0,
          ),
          const SizedBox(height: 10),
          Text(
            'Quizz-it',
            style: TextStyle(
              fontFamily: 'Aoboshi',
              fontSize: 80,
              color: darkTheme.onBackground,
            ),
          ),
          const SizedBox(height: 100),
          OutlinedButton(
            onPressed: () {
              screenChange();
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: darkTheme.secondary,
              foregroundColor: darkTheme.onPrimary,
            ),
            child: const Text("Start a Quiz"),
          )
        ],
      ),

      //backgroundColor: Color.fromARGB(255, 151, 82, 82),
    );
  }
}
