import 'package:flutter/material.dart';
import 'package:music_rental_flutter/pages/login/login_page.dart';
import 'package:music_rental_flutter/pages/signup/components/signup_auth-provider.dart';
import 'package:music_rental_flutter/widgets/my_button.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();

  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    SignupAuthProvider signupAuthProvider =
        Provider.of<SignupAuthProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    controller: name,
                    decoration: const InputDecoration(
                      hintText: "Full Name",
                    ),
                  ),
                  TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                  TextFormField(
                    controller: address,
                    decoration: const InputDecoration(
                      hintText: "Address",
                    ),
                  ),
                  TextFormField(
                    controller: number,
                    decoration: const InputDecoration(
                      hintText: "Phone",
                    ),
                  ),
                  TextFormField(
                    obscureText: visibility,
                    controller: password,
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
                ],
              ),
              Column(
                children: [
                  signupAuthProvider.loading == false
                      ? MyButton(
                          onPressed: () {
                            signupAuthProvider.signupValidation(
                              fullName: name,
                              email: email,
                              address: address,
                              number: number,
                              password: password,
                              context: context,
                            );
                          },
                          btnText: "SIGN UP",
                          color: const [Color(0xff027f47), Color(0xff01a95c)],
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?\t\t"),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          ),
                        },
                        child: const Text("LOG IN"),
                      ),
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
