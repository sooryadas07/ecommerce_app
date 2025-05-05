import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Newpage extends StatefulWidget {
  const Newpage({super.key});

  @override
  State<Newpage> createState() => _NewpageState();
}

class _NewpageState extends State<Newpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white30,body: Padding(
      padding: const EdgeInsets.only(right:30,left:120,top:350),
      child: Text("Ooops something wrong !"),
    ),);
  }
}
