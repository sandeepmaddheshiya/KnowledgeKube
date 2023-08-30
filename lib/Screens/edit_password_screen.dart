import 'package:flutter/material.dart';
import 'package:quiz_app/Auth/signup.dart';

String email = emailController.text;

void editPassword() {
  for (var sublist in signupList) {
    if (sublist.length >= 3 && sublist[1] == email) {
      sublist[2] = passwordController.text;
    }
  }
}

class EditPassword extends StatelessWidget {
  const EditPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Change your password",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'New Password',
                  hintText: 'Enter Your New Password',
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              editPassword();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Password Changed")));
            },
            child: const Text("Okay")),
      ],
    );
  }
}
