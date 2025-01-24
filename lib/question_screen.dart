import 'package:flutter/material.dart';
import 'package:myapp/answer_button.dart';
import 'package:myapp/data/quizz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/results_screen.dart';
class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  final List<String> selectedAnswers = [];
  void answerQuestion(String selectedAnswer) {
    setState(() {
      selectedAnswers.add(selectedAnswer);
      if (currentQuestionIndex < questions.length -1) {
        currentQuestionIndex++;
      }else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ResultsScreen(selectedAnswers: selectedAnswers),
          ),
        );
      };
    });
  }


  void answerQuestiong(){
    setState(() {
      if (currentQuestionIndex < questions.length -1){
        currentQuestionIndex ++;
      } else{
        currentQuestionIndex ++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlue, Colors.yellow],
            ),
          ),
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentQuestion.question,
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(0, 176, 176, 231),
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ...currentQuestion.getShuffledAnswers().map((answer) {
                    return AnswerButton(
                      answer: answer, 
                      onTap: () => answerQuestion(answer));
                  },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

