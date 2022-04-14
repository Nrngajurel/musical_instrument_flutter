import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_rental_flutter/network/network_service.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';
import 'package:music_rental_flutter/pages/verification/verification_page.dart';

class SignupAuthProvider with ChangeNotifier {
  static Pattern emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp emailRegExp = RegExp(SignupAuthProvider.emailPattern.toString());

  static Pattern numPattern = r'^(?:[+0]9)?[0-9]{10}$';
  RegExp numRegExp = RegExp(SignupAuthProvider.numPattern.toString());

  bool loading = false;

  void signupValidation(
      {required TextEditingController? fullName,
      required TextEditingController? email,
      required TextEditingController? address,
      required TextEditingController? number,
      required TextEditingController? password,
      required BuildContext context}) async {
    loading = true;
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
    } else {
      final response = await NetworkService.sendRequest(
          requestType: RequestType.post,
          url: StaticValues.apiUrlUser,
          body: {
            'name': fullName.text,
            'address': address.text,
            'number': number.text,
            'password': password.text,
            'email': email.text
          });

      final mapVal = json.decode(response!.body);
      if (mapVal.isNotEmpty) {
        if (mapVal["success"] == "2") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Email already in use"),
            ),
          );
          loading = false;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(mapVal["message"]),
            ),
          );
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const VerificationPage()));
          loading = false;
        }
      }
    }
  }
}
