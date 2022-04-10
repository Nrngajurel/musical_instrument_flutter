import 'package:flutter/material.dart';

class EndPart extends StatelessWidget {
  const EndPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {},
          height: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(04),
          ),
          // ignore: prefer_const_constructors
          padding: EdgeInsets.all(0),
          child: Ink(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xff027f47), Color(0xff01a95c)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(04),
            ),
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: const Text(
                "LOG IN",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        MaterialButton(
          onPressed: () {},
          height: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(04),
          ),
          // ignore: prefer_const_constructors
          padding: EdgeInsets.all(0),
          child: Ink(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 3, 84, 138),
                  Color.fromARGB(255, 3, 75, 122)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(04),
            ),
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: const Text(
                "ADMIN LOGIN",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            "SIGN UP",
            style: TextStyle(color: Color(0xff797b7a)),
          ),
        ),
      ],
    );
  }
}
