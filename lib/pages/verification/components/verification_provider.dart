import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:music_rental_flutter/network/network_service.dart';
import 'package:music_rental_flutter/pages/login/login_page.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';

class VerificationProvider with ChangeNotifier {
  bool loading = false;
  void verifyUser(
      {required TextEditingController? verificationCode,
      required final data,
      required BuildContext context}) async {
    loading = true;
    if (verificationCode!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("The field is empty"),
      ));
    } else {
      final response = await NetworkService.sendRequest(
        requestType: RequestType.post,
        url: StaticValues.apiUrlUser + "/verify",
        body: data,
      );
      final responseMap = json.decode(response!.body);
      if (responseMap["status"] == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(responseMap["message"]),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(responseMap["message"]),
          ),
        );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const LoginPage()));
      }
    }
    loading = false;
  }
}
