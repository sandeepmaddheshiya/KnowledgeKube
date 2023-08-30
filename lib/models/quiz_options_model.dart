import 'package:flutter/material.dart';

class QuizoptionModel extends StatelessWidget {
  final String title;
  final String imgUrl;
  final VoidCallback onTap;
  // final double width;

  const QuizoptionModel({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 375,
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 3,
          shadowColor: Colors.grey,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                imgUrl,
                width: 70,
                height: 70,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
