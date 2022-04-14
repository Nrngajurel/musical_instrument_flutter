import 'package:flutter/material.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Verfication",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            )
          ],
        ),
      ),
    );
  }
}
