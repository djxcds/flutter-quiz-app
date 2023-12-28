import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(122, 255, 255, 255),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            onPressed: switchScreen,
            style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
            icon: const Icon(
              Icons.arrow_forward,
              textDirection: TextDirection.ltr,
            ),
            label: const Text('Go!'),
          )
        ],
      ),
    );
  }
}
