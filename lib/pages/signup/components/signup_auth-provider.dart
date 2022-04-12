import 'package:flutter/material.dart';

class SignupAuthProvider with ChangeNotifier {
  static Pattern emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp emailRegExp = RegExp(SignupAuthProvider.emailPattern.toString());

  static Pattern numPattern = r'^(?:[+0]9)?[0-9]{10}$';
  RegExp numRegExp = RegExp(SignupAuthProvider.numPattern.toString());

  void signupValidation(
      {required TextEditingController? fullName,
      required TextEditingController? email,
      required TextEditingController? address,
      required TextEditingController? number,
      required TextEditingController? password,
      required BuildContext context}) async {
    if (fullName!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Name is empty"),
        ),
      );
      return;
    } else if (email!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email is empty"),
        ),
      );
      return;
    } else if (!emailRegExp.hasMatch(email.text.toString())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid email address"),
        ),
      );
      return;
    } else if (password!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password is empty!!"),
        ),
      );
    } else if (password.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password must be more than or equal to 8 characters"),
        ),
      );
    } else if (address!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Address bar is empty"),
        ),
      );
    } else if (number!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Number is empty!!"),
        ),
      );
    } else if (!numRegExp.hasMatch(number.text.toString())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid number"),
        ),
      );
    }
  }
}
