import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:velocity_x/velocity_x.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

const user = {"name": "John Doe", "email": "john@gmail.com"};

class _UserProfileState extends State<UserProfile> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
          children: [
            // vertical space
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"),
            ),
            Text(
              user["name"] ?? "Name",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              user["email"] ?? "email",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
