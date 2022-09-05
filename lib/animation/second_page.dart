import 'package:flutter/material.dart';
import 'package:sample/animation/third_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,body: Image.asset('assets/cat.webp',));
  }
}
