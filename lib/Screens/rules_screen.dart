import 'package:flutter/material.dart';

class RuleScreen extends StatelessWidget {
  const RuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        padding: const EdgeInsets.all(20),
        child: const Column(
          children: [
            Text(
              "Rules",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text("1.There will be 10 questions."),
            Text("2.You'll score 1 marks for each correct answer."),
            Text("3.There is no negative marking."),
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
    );
  }
}
