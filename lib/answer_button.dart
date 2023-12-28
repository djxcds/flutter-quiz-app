import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.onTap, required this.answerText});

  final void Function() onTap;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
