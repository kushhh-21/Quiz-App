import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  final smallText1 = 'Correct Answer: ';
  final smallText2 = 'Answer Choose: ';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (data['answer'] == data['correct_answer'])
                        ? const Color.fromARGB(196, 34, 215, 14)
                        : const Color.fromARGB(208, 227, 8, 74),
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(169, 0, 0, 0),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.manrope(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(206, 255, 255, 255)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        smallText2 + (data['answer'] as String),
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: (data['answer'] == data['correct_answer'])
                              ? const Color.fromARGB(196, 34, 215, 14)
                              : const Color.fromARGB(208, 227, 8, 74),
                        ),
                      ),
                      Text(
                        smallText1 + (data['correct_answer'] as String),
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(196, 34, 215, 14),
                            fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
