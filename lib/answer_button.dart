import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answertext, required this.onTap});
  final String answertext;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    onPressed: onTap, 
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 40,
      ),
      backgroundColor: const Color.fromARGB(235, 25, 6, 62),
      foregroundColor: Color.fromARGB(135, 184, 205, 212),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      )
    ),
    child: Text(
      answertext,
      textAlign: TextAlign.center
      )
    );
  }
}
