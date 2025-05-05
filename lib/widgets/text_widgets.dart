import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidgets extends StatefulWidget {
  final String text;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool?obsecureText;


  const TextWidgets({
    super.key,
    required this.text,
    this.prefixIcon,
    this.suffixIcon,
    this. obsecureText,
  });

  @override
  State<TextWidgets> createState() => _TextWidgetsState();
}

class _TextWidgetsState extends State<TextWidgets> {
  bool isPasswordObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 40, right: 40),
        child: TextField(obscureText: widget.obsecureText??false,
          decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(),
              hintText: widget.text,
              suffixIcon: widget.suffixIcon ?? SizedBox(),
              hintStyle: TextStyle(color: Colors.black)),
          style: TextStyle(),
        ));
  }
}
