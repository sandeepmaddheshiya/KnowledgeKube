import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/Auth/login.dart';
import 'package:quiz_app/Auth/signup.dart';
import 'package:quiz_app/Screens/edit_password_screen.dart';
import 'package:quiz_app/Screens/history_screen.dart';
import 'package:quiz_app/Screens/rules_screen.dart';
import 'package:quiz_app/Screens/start_quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 255, 26, 114),
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 255, 26, 114),
          // leading: Icons.,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Home",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Hello, $name",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Menu",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 375,
                          height: 120,
                          child: InkWell(
                            onTap: () {
                              log("Start Quiz");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const StartQuizScreen()));
                            },
                            child: Card(
                              shadowColor: Colors.grey,
                              color: const Color.fromARGB(255, 251, 249, 249),
                              elevation: 3,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Image.asset(
                                    'assets/quiz.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text(
                                    "Start Quiz",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 182.5,
                              height: 120,
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: ((context) =>
                                          const RuleScreen()));
                                  log("Rules");
                                },
                                child: Card(
                                  shadowColor: Colors.grey,
                                  color:
                                      const Color.fromARGB(255, 251, 249, 249),
                                  elevation: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/regulation.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "Rules",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 182.5,
                              height: 120,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const HistoryScreen()));
                                  log("History");
                                },
                                child: Card(
                                  shadowColor: Colors.grey,
                                  color:
                                      const Color.fromARGB(255, 251, 249, 249),
                                  elevation: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/history.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "History",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 182.5,
                              height: 120,
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: ((context) =>
                                          const EditPassword()));
                                  log("Edit Password");
                                },
                                child: Card(
                                  shadowColor: Colors.grey,
                                  color:
                                      const Color.fromARGB(255, 251, 249, 249),
                                  elevation: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/edit_password.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "Edit Password",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 182.5,
                              height: 120,
                              child: InkWell(
                                onTap: () {
                                  isLoggedIn = false;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Login()));
                                  log("Logout");
                                },
                                child: Card(
                                  shadowColor: Colors.grey,
                                  color:
                                      const Color.fromARGB(255, 251, 249, 249),
                                  elevation: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/logout.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "Logout",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
