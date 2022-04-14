import 'package:flutter/material.dart';
import 'package:music_rental_flutter/widgets/my_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "LOG IN",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: visibility,
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    icon: Icon(
                      visibility ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                onPressed: () {},
                btnText: "LOGIN",
                color: const [Color(0xff027f47), Color(0xff01a95c)],
              )
            ],
          ),
        ),
      ),
    );
  }
}
