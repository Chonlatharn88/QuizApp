import 'package:flutter/material.dart';
import 'start_screen.dart'; // Ensure you import your StartScreen
 
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({required this.selectedAnswers, super.key});
  final List<String> selectedAnswers;
 
  @override
  Widget build(BuildContext context) {
    // Assuming you have a way to calculate correct answers
    final int correctAnswers = selectedAnswers.where((answer) => answer == "correct").length;
    final int totalQuestions = 6;
 
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange, Colors.yellow],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You answered $correctAnswers out of $totalQuestions questions correctly!",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StartScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.refresh, color: Colors.white),
                label: const Text(
                  'Restart Quiz',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}