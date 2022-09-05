import 'package:flutter/material.dart';
import 'package:sample/extensions.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  String text = 'sample text';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(text).setBiggerText(),
            const SizedBox(height: 20,),
            Text('sample').addBox()
          ],
        ),
      ),
    );
  }
}
