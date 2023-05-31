import 'package:google_fonts/google_fonts.dart';
import 'package:secondapp/questions/questions.dart';
import 'package:flutter/material.dart';
import 'package:secondapp/summary_box.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedAnswer, {super.key});

  final List<String> selectedAnswer;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];

    for (int i = 0; i < selectedAnswer.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'selected_answer': selectedAnswer[i]
      });
    }

    return summaryData;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final total = questions.length;
    final correct = summaryData.where((data) {
      return data['correct_answer'] == data['selected_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correct out of $total answers correctly !',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                SummaryBox(summaryData),
              ],
            ),
            TextButton(onPressed: () {}, child: const Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}
