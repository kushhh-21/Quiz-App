import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.changeScreen, {super.key});

  final void Function() changeScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 300,
            width: 300,
            color: const Color.fromARGB(180, 255, 255, 255),
          ),
          const SizedBox(
            height: 50,
          ),
          Text('Learn the Flutter in Fun Way!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
              )),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: changeScreen,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
              side: const BorderSide(
                width: 2,
                color: Colors.white,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(12),
                  right: Radius.circular(12),
                ),
              ),
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
