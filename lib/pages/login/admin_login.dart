import 'package:flutter/material.dart';
import 'package:music_rental_flutter/pages/login/components/admin_login_provider.dart';
import 'package:music_rental_flutter/widgets/my_button.dart';
import 'package:provider/provider.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool visibility = true;
  @override
  Widget build(BuildContext context) {
    AdminLoginProvider loginProvider = Provider.of<AdminLoginProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "ADMIN LOG IN",
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
                controller: username,
                decoration: const InputDecoration(
                  hintText: "Username",
                ),
              ),
              const SizedBox(
                height: 20,
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
              const SizedBox(
                height: 30,
              ),
              loginProvider.loading == false
                  ? MyButton(
                      onPressed: () {
                        loginProvider.loading = true;
                        loginProvider.loginUser(
                            email: username,
                            password: password,
                            context: context);
                      },
                      btnText: "LOGIN",
                      color: const [Color(0xff027f47), Color(0xff01a95c)],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
