import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_rental_flutter/network/network_service.dart';
import 'package:music_rental_flutter/pages/homepage/admin/admin_home.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';

final storage = FlutterSecureStorage();

class AdminLoginProvider with ChangeNotifier {
  bool loading = false;
  void loginUser({
    required TextEditingController? email,
    required TextEditingController? password,
    required BuildContext context,
  }) async {
    // loading = true;
    if (email!.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username field is empty"),
        ),
      );
      loading = false;
    } else if (password!.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password field is empty"),
        ),
      );
      loading = false;
    } else {
      final response = await NetworkService.sendRequest(
        requestType: RequestType.post,
        url: StaticValues.apiUrlAdmin + "/login",
        body: {
          'password': password.text,
          'username': email.text,
        },
      );
      print(response);
      final resMap = json.decode(response!.body);
      if (resMap["success"] == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(resMap["data"]),
          ),
        );
      } else {
        await storage.write(key: "userToken", value: resMap["token"]);
        await storage.write(key: "auth", value: "admin");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const AdminHome()));
      }
      loading = false;
    }
  }
}
