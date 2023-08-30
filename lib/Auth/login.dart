import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/Auth/signup.dart';
import 'package:quiz_app/Screens/home_screen.dart';

bool isLoggedIn = false;

void login() {
  for (List<String> sublist in signupList) {
    if (sublist.contains(emailController.text) &&
        sublist.contains(passwordController.text)) {
      log('Successfully Logged in');
      isLoggedIn = true;
      log("$isLoggedIn");
    } else {
      log("Login Failed");
    }
  }

  // for (int i = 0; i < signupList.length; i++) {
  //   for (int j = 0; j < 3; j++) {
  //     if (emailController.text == signupList[i][j] &&
  //         passwordController.text == signupList[i][j]) {

  //     }
  //   }
  // }
}

class Login extends StatelessWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignIn'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter Your Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  login();
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    if (isLoggedIn) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const HomeScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("No account exists")));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please fill the required fields")));
                  }
                },
                child: const Text('SignIn'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    text: "Don't have an account",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const Signup()));
                    },
                    child: const Text(
                      'SignUp',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
