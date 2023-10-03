import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/quiz_question.dart';
import 'package:quiz_app/widget/summary_widget.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {super.key, required this.chosenAnswers, required this.resetQuiz});

  final List<String> chosenAnswers;

  final void Function() resetQuiz;

  final List<Map<String, Object>> summary = [];

  List<Map<String, Object>> makeSummary() {
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questionsAnswers[i].question,
        'answer': chosenAnswers[i],
        'correct_answer': questionsAnswers[i].answer[0]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = makeSummary();
    final totalQuestions = questionsAnswers.length;
    final score = summaryData.where((data) {
      return data['answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $score out of $totalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 213, 138, 226),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SummaryWidget(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: resetQuiz,
                icon: const Icon(
                  Icons.restart_alt_outlined,
                  color: Colors.cyan,
                ),
                label: Text(
                  'Reset Quiz',
                  style: GoogleFonts.lato(
                    color: Colors.cyan,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
