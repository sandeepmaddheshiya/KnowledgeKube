import 'package:flutter/material.dart';
import 'package:quiz_app/models/font/texts_model.dart';

class AnswerButtonModel extends StatelessWidget {
  const AnswerButtonModel({
    super.key,
    required this.onTap,
    required this.buttonColor,
    required this.answers,
  });

  final VoidCallback onTap;
  final Color buttonColor;
  final String answers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: buttonColor,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          child: normalText(text: answers, size: 16, color: Colors.black),
        ),
      ),
    );
  }
}
