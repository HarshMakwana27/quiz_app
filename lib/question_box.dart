import 'package:flutter/material.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox(this.isTrue, this.index, {super.key});

  final bool isTrue;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isTrue
              ? const Color.fromARGB(255, 61, 209, 66)
              : const Color.fromARGB(255, 210, 40, 27)),
      child: Text(
        (index + 1).toString(),
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
