import 'package:basics_app/questions_summary/question_summary_number.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData['user_answer'] as String ==
        itemData['correct_answer'] as String;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionSummaryNumber(
            (itemData['question_index'] as int), isCorrectAnswer),
        const SizedBox(height: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData['correct_answer'] as String,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 242, 242, 94),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                itemData['user_answer'] as String,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 127, 127, 127),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        )
      ],
    );
  }
}
