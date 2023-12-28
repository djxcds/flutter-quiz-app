import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummaryNumber extends StatelessWidget {
  const QuestionSummaryNumber(this.questionIndex, this.isCorrectAnswer,
      {super.key});

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.only(right: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isCorrectAnswer ? Colors.green : Colors.red,
      ),
      child: Text(
        questionNumber.toString(),
        style: GoogleFonts.lato(
          color: isCorrectAnswer ? Colors.white : Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
