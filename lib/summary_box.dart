import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secondapp/colors/dark_theme.dart';
import 'package:secondapp/question_box.dart';

class SummaryBox extends StatelessWidget {
  const SummaryBox(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            bool isTrue() {
              return data['selected_answer'] == data['correct_answer'];
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionBox(isTrue(), data['question_index'] as int),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 156, 186, 238),
                            fontSize: 12),
                      ),
                      Text(
                        data['selected_answer'] as String,
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 39, 176, 130),
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.poppins(
                          color: darkTheme.primary,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
