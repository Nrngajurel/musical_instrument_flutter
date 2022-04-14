import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_rental_flutter/network/network_service.dart';
import 'package:music_rental_flutter/pages/homepage/user/user_home.dart';
import 'package:music_rental_flutter/pages/login/components/login_provider.dart';
import 'package:music_rental_flutter/pages/signup/components/signup_auth-provider.dart';
import 'package:music_rental_flutter/pages/signup/signup_page.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';
import 'package:music_rental_flutter/pages/verification/components/verification_provider.dart';
import 'package:provider/provider.dart';

import 'pages/welcome/welcome_page.dart';

final storage = FlutterSecureStorage();

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "userToken");
    if (jwt == null) return "";
    return jwt;
  }

  Future<bool> verifyToken() async {
    String jwt = await jwtOrEmpty;
    if (jwt == "") return false;
    final response = await NetworkService.sendRequest(
      requestType: RequestType.post,
      url: StaticValues.apiUrlUser + "/token",
      body: {"token": jwt},
    );
    final resultMap = json.decode(response!.body);
    if (resultMap["success"] == 0) {
      return false;
    } else if (resultMap["success"] == 1) {
      return true;
    } else {
      return false;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignupAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VerificationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music Rental',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder<bool>(
          future: verifyToken(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == false) {
              return const WelcomePage();
            } else {
              return const UserHomePage();
            }
          },
        ),
      ),
    );
  }
}
