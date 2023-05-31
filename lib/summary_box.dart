import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 0, 255, 51),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                    )),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 156, 186, 238),
                            fontSize: 14),
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
                          color: const Color.fromARGB(255, 200, 59, 239),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
