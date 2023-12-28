import 'package:basics_app/data/questions.dart';
import 'package:basics_app/questions_summary/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.restartQuiz, this.chosenAnswers, {super.key});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final int numTotalQuestions = questions.length;
    final int numCorrectQuestions = summaryData
        .where((item) => item['correct_answer'] == item['user_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(Icons.refresh),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              label: const Text(
                'Restart Quiz',
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
