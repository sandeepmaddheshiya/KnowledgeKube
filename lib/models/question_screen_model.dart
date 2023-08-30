import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/result_screen.dart';
import 'package:quiz_app/Screens/start_quiz_screen.dart';
import 'package:quiz_app/models/add_new_history_model.dart';
import 'package:quiz_app/models/questions_model.dart';
import 'package:quiz_app/models/quiz_questions.dart';

var currentQuestionIndex = 0;
int seconds = 15;
int score = 0;
final List<AddNewHistory> newHistoryList = [];
int resultIndex = -1;
List<int> result = [];

String historyImgUrl = (quizType1)
    ? imgUrl1
    : (quizType2)
        ? imgUrl2
        : imgUrl3;
String historyTitleUrl = (quizType1)
    ? title1
    : (quizType2)
        ? title2
        : title3;

class QuestionScreen extends StatefulWidget {
  final List<QuizQuestion> qList;
  const QuestionScreen({
    super.key,
    required this.qList,
  });
  // final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late List<String> shuffledAnswers;

  @override
  void initState() {
    super.initState();
    startTimer();
    shuffleAnswers();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  void shuffleAnswers() {
    final currentQuestion = widget.qList[currentQuestionIndex];
    shuffledAnswers = currentQuestion.getShuffledAnswers();
  }

  Timer? timer;
  late Future quiz;

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          timer.cancel();
          shuffleAnswers();
        }
      });
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < widget.qList.length - 1) {
      currentQuestionIndex += 1;
      shuffleAnswers();
      seconds = 15;
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const ResultScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (seconds == 0) {
      nextQuestion();
    }
    final currentQuestion = widget.qList[currentQuestionIndex];
    final correctAnswer = widget.qList[currentQuestionIndex].answers[0];

    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 0, 67, 34),
                Color.fromARGB(255, 58, 147, 7)
              ])),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        score = 0;
                        currentQuestionIndex = 0;
                        seconds = 15;
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: CircularProgressIndicator(
                            value: seconds / 15,
                            valueColor:
                                const AlwaysStoppedAnimation(Colors.blueAccent),
                            // backgroundColor: Colors.blueAccent,
                            // color: Colors.blueAccent,
                          ),
                        ),
                        Text(
                          "$seconds",
                          style: const TextStyle(
                              fontSize: 45, color: Colors.white),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Hint!",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text("The correct answer is-"),
                                        Text(correctAnswer),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Okay")),
                                  ],
                                ));
                      },
                      child: SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.asset("assets/light-bulb.png")),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset("assets/think1.png"),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20)
                            .copyWith(top: 20),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.topLeft,
                          width: double.infinity,
                          child: QuestionsModel(
                              onTaps: () {
                                nextQuestion();
                                if (correctAnswer == selectedAnswer) {
                                  score++;
                                } else {
                                  log("Wrong");
                                }
                                log("score: $score");
                              },
                              questionTitle: currentQuestion.text,
                              answers1: shuffledAnswers[0],
                              answers2: shuffledAnswers[1],
                              answers3: shuffledAnswers[2],
                              answers4: shuffledAnswers[3],
                              buttonColor: Colors.blue),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
