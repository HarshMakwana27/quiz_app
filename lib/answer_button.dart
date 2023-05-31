import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secondapp/colors/dark_theme.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {super.key});

  final String answerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding:
              const EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 20),
          backgroundColor: darkTheme.secondary,
          foregroundColor: darkTheme.onPrimary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          answerText,
          style: GoogleFonts.poppins(
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
