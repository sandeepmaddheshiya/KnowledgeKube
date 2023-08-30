import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/start_quiz_screen.dart';
import 'package:quiz_app/models/add_new_history_model.dart';
import 'package:quiz_app/models/font/texts_model.dart';
import 'package:quiz_app/models/question_screen_model.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late List<String> shuffledAnswers;

  @override
  void initState() {
    super.initState();
  }

  String? wish;
  void greetings() {
    wish = (score == 0)
        ? "Oh No"
        : (score < 5)
            ? "Good"
            : (score < 10)
                ? "Great"
                : "Perfect";
  }

  String? imgUrl;
  void greetingsImg() {
    imgUrl = (score == 0)
        ? "assets/ohno.png"
        : (score < 5)
            ? "assets/good.png"
            : (score < 10)
                ? "assets/great.png"
                : "assets/congratulation.png";
  }

  @override
  Widget build(BuildContext context) {
    greetings();
    greetingsImg();
    return SafeArea(
        child: Scaffold(
      body: Container(
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
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset("$imgUrl"),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              headingText(
                                  text: "$wish! you've scored $score out 10",
                                  color: Colors.white,
                                  size: 28),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        seconds = 15;
                                        currentQuestionIndex = 0;
                                        score = 0;
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => QuestionScreen(
                                                    qList: prevList)));
                                      },
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: Colors.blueAccent,
                                          foregroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30))),
                                      child: normalText(
                                          text: "Retry",
                                          size: 16,
                                          color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        newHistoryList.add(AddNewHistory(
                                            id: DateTime.now().toString(),
                                            imgURL: historyImgUrl,
                                            score: score,
                                            title: historyTitleUrl));
                                        resultIndex += 1;
                                        result.add(score);
                                        seconds = 15;
                                        currentQuestionIndex = 0;
                                        score = 0;
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: Colors.blueAccent,
                                          foregroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30))),
                                      child: normalText(
                                          text: "Exit",
                                          size: 16,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
