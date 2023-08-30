import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/Screens/start_quiz_screen.dart';
import 'package:quiz_app/models/history_card_model.dart';
import 'package:quiz_app/models/question_screen_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        backgroundColor: const Color.fromARGB(255, 255, 26, 114),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...newHistoryList.map(
              (button) => Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  setState(() {
                    newHistoryList.remove(button);
                  });
                },
                background: Container(
                  color: Colors.red,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                child: HistoryCardModel(
                    score: result[resultIndex],
                    title: (quizType1)
                        ? title1
                        : (quizType2)
                            ? title2
                            : title3,
                    imgUrl: (quizType1)
                        ? imgUrl1
                        : (quizType2)
                            ? imgUrl2
                            : imgUrl3,
                    currentDateTime: DateFormat('h:mm:a  dd-MM-yyyy ')
                        .format(DateTime.now())
                        .toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
