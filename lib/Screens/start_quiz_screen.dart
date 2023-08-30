import 'package:flutter/material.dart';
import 'package:quiz_app/data/geography/geography_questions.dart';
import 'package:quiz_app/data/literature/literature_questions.dart';
import 'package:quiz_app/data/math/math_questions.dart';
import 'package:quiz_app/models/question_screen_model.dart';
import 'package:quiz_app/models/quiz_options_model.dart';
import 'package:quiz_app/models/quiz_questions.dart';

List<QuizQuestion> prevList = [];

String imgUrl1 = "assets/math.png";
String imgUrl2 = "assets/geography.png";
String imgUrl3 = "assets/literature.png";

String title1 = "Math";
String title2 = "Geography";
String title3 = "Literature";

bool quizType1 = false;
bool quizType2 = false;
bool quizType3 = false;

class StartQuizScreen extends StatelessWidget {
  const StartQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Option"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
        child: Column(
          children: [
            QuizoptionModel(
                title: title1,
                imgUrl: imgUrl1,
                onTap: () {
                  quizType1 = true;
                  quizType2 = false;
                  quizType3 = false;
                  prevList = mathQuestions;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const QuestionScreen(
                                qList: mathQuestions,
                              )));
                }),
            QuizoptionModel(
                title: title2,
                imgUrl: imgUrl2,
                onTap: () {
                  quizType2 = true;
                  quizType1 = false;
                  quizType3 = false;

                  prevList = geographyQuestions;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const QuestionScreen(
                                qList: geographyQuestions,
                              )));
                }),
            QuizoptionModel(
                title: title3,
                imgUrl: imgUrl3,
                onTap: () {
                  quizType3 = true;
                  quizType1 = false;
                  quizType2 = false;

                  prevList = literatureQuestions;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const QuestionScreen(
                                qList: literatureQuestions,
                              )));
                }),
          ],
        ),
      ),
    );
  }
}
