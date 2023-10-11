import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(height: 80),
          Text(
              style: GoogleFonts.ubuntu(
              color: Color.fromARGB(32, 19, 26, 15),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            'Learn Flutter the fun way!'
            ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 189, 99, 99),
                ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('start Quiz'),
          ),
        ],
      ) 
    );
  }
}
