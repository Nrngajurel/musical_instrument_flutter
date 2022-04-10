import 'package:flutter/material.dart';
import 'package:music_rental_flutter/widgets/my_button.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "SIGN UP",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Full Name",
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Address",
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Phone",
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  MyButton(
                    onPressed: () {},
                    btnText: "SIGN UP",
                    color: const [Color(0xff027f47), Color(0xff01a95c)],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Already have an account?\t\t"),
                      Text("LOG IN"),
                    ],
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
