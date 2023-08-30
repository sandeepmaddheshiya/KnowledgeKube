import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer_button_model.dart';
import 'package:quiz_app/models/font/texts_model.dart';

String? selectedAnswer;

class QuestionsModel extends StatefulWidget {
  final VoidCallback onTaps;

  final String questionTitle;
  final String answers1;
  final String answers2;
  final String answers3;
  final String answers4;
  final Color buttonColor;

  QuestionsModel({
    super.key,
    required this.onTaps,
    required this.questionTitle,
    required this.answers1,
    required this.answers2,
    required this.answers3,
    required this.answers4,
    required this.buttonColor,
  });

  @override
  State<QuestionsModel> createState() => _QuestionsModelState();
}

class _QuestionsModelState extends State<QuestionsModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          headingText(
              text: widget.questionTitle, size: 18, color: Colors.white),
          const SizedBox(
            height: 20,
          ),
          AnswerButtonModel(
              onTap: () {
                setState(() {
                  selectedAnswer = widget.answers1;
                  widget.onTaps();
                  log("$selectedAnswer");
                });
              },
              buttonColor: widget.buttonColor,
              answers: widget.answers1),
          AnswerButtonModel(
              onTap: () {
                setState(() {
                  selectedAnswer = widget.answers2;
                  widget.onTaps();
                  log("$selectedAnswer");
                });
              },
              buttonColor: widget.buttonColor,
              answers: widget.answers2),
          AnswerButtonModel(
              onTap: () {
                setState(() {
                  selectedAnswer = widget.answers3;
                  widget.onTaps();
                  log("$selectedAnswer");
                });
              },
              buttonColor: widget.buttonColor,
              answers: widget.answers3),
          AnswerButtonModel(
              onTap: () {
                setState(() {
                  selectedAnswer = widget.answers4;
                  widget.onTaps();
                  log("$selectedAnswer");
                });
              },
              buttonColor: widget.buttonColor,
              answers: widget.answers4),
        ],
      ),
    );
  }
}

// ...currentQuestion.getShuffledAnswers().map(
//             (answer) {
//               return AnswerButtonModel(
//                   onTap: onTap, buttonColor: buttonColor, answers: answer);
//             },
