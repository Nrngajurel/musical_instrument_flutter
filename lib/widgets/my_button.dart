import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  void Function()? onPressed;
  final String btnText;
  final color;
  MyButton({
    Key? key,
    required this.onPressed,
    required this.btnText,
    required this.color,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.onPressed,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(04),
      ),
      // ignore: prefer_const_constructors
      padding: EdgeInsets.all(0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.color,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(04),
        ),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text(
            widget.btnText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
