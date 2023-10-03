import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home_screen.dart';
import 'package:quiz_app/screen/questions.dart';
import 'package:quiz_app/data/quiz_question.dart';
import 'package:quiz_app/screen/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  final List<Color> colors = [
    const Color.fromARGB(255, 135, 6, 200),
    const Color.fromARGB(255, 51, 2, 82),
  ];

  void onSelectingAnswers(String answer) {
    selectedAnswers.add(answer);

    setState(() {
      if (selectedAnswers.length == questionsAnswers.length) {
        activeScreen = 'result-screen';
      }
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void resetting() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'home-screem';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetScreen = HomeScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      widgetScreen = QuestionScreen(onAnswered: onSelectingAnswers);
    }

    if (activeScreen == 'result-screen') {
      widgetScreen = ResultScreen(
        chosenAnswers: selectedAnswers,
        resetQuiz: resetting,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: colors,
              radius: 3.0,
              center: Alignment.topCenter,
            ),
          ),
          child: widgetScreen,
        ),
      ),
    );
  }
}
