import 'package:basics_app/data/questions.dart';
import 'package:basics_app/questions_screen.dart';
import 'package:basics_app/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:basics_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  String activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  BoxDecoration boxDecorationSetting() {
    return const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.yellow, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight));
  }

  @override
  Widget build(context) {
    Widget activeWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      activeWidget = QuestionsScreen(chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      activeWidget = ResultsScreen(restartQuiz, _selectedAnswers);
    }

    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: boxDecorationSetting(),
        child: activeWidget,
      ),
    ));
  }
}
