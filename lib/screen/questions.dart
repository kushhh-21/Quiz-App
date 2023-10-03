import 'package:flutter/material.dart';
import 'package:quiz_app/widget/answer_button.dart';
import 'package:quiz_app/data/quiz_question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onAnswered});

  final void Function(String answer) onAnswered;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var questionsAnswersIndex = 0;

  void changeQuestionAnswer(String answer) {
    widget.onAnswered(answer);
    setState(() {
      questionsAnswersIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestionAnswer = questionsAnswers[questionsAnswersIndex];
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestionAnswer.question,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 218, 164, 249),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestionAnswer.getShuffledList().map((answer) {
            return AnswerButton(
              answerText: answer,
              onTap: () => changeQuestionAnswer(answer),
            );
          }),
        ],
      ),
    );
  }
}
