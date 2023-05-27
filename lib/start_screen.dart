import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.screenChange, {super.key});

  final void Function() screenChange;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 300.0,
          ),
          const SizedBox(height: 10),
          const Text(
            'Quizz-it',
            style: TextStyle(
                fontFamily: 'Aoboshi',
                fontSize: 80,
                color: Color.fromARGB(255, 30, 3, 3)),
          ),
          const SizedBox(height: 100),
          OutlinedButton.icon(
            onPressed: () {
              screenChange();
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 8, 51, 67),
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.start_outlined),
            label: const Text("Start a Quiz"),
          )
        ],
      ),

      //backgroundColor: Color.fromARGB(255, 151, 82, 82),
    );
  }
}
