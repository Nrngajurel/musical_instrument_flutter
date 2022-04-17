import 'package:flutter/material.dart';
import 'package:music_rental_flutter/pages/login/admin_login.dart';
import 'package:music_rental_flutter/pages/login/login_page.dart';
import 'package:music_rental_flutter/pages/signup/signup_page.dart';
import 'package:music_rental_flutter/widgets/my_button.dart';

class EndPart extends StatelessWidget {
  const EndPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          btnText: "LOG IN",
          color: const [Color(0xff027f47), Color(0xff01a95c)],
        ),
        const SizedBox(
          height: 20,
        ),
        MyButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AdminLogin()),
            );
          },
          btnText: "ADMIN LOGIN",
          color: const [
            Color.fromARGB(255, 3, 84, 138),
            Color.fromARGB(255, 3, 75, 122)
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupPage()),
            );
          },
          child: const Text(
            "SIGN UP",
            style: TextStyle(color: Color(0xff797b7a)),
          ),
        ),
      ],
    );
  }
}
