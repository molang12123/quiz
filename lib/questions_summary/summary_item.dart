import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});
  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(questionIndex: itemData['question_index']as int,
         isCorrectAnswer: isCorrectAnswer
         ),
         const SizedBox(
          width: 20,
         ),
         Expanded(child: 
         Column(
          children: [
            Text(
              itemData['question']as String,
              style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontWeight:FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              itemData['user_answer']as String,
              style: GoogleFonts.ubuntu(
                color: const Color.fromARGB(255, 245, 14, 176),
                fontWeight:FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              itemData['correct_answer']as String,
              style: GoogleFonts.ubuntu(
                color: const Color.fromARGB(255, 3, 248, 85),
                fontWeight:FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
         ))
      ],
    );
  }
}
