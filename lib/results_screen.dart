import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_summary/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart, 
    required this.onExit,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;
  final void Function() onExit;
  
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        "question": questions[i].answers[0],
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          children: [
            Text(
                'You answered $numCorrectQuestions of $numTotalQuestions questions correctly!',
                style: GoogleFonts.ubuntu(
                color: const Color.fromARGB(235 , 23, 23, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(getSummaryData()),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(88, 241, 8, 27),
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton.icon(
              onPressed: onExit,
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(88, 241, 8, 27),
              ),
              icon: const Icon(Icons.exit_to_app),
              label: const Text('Exit Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
