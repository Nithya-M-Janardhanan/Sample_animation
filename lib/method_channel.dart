import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelSample extends StatefulWidget {
  const MethodChannelSample({Key? key}) : super(key: key);

  @override
  State<MethodChannelSample> createState() => _MethodChannelSampleState();
}

class _MethodChannelSampleState extends State<MethodChannelSample> {
  static const platform = MethodChannel('flutter');
  String _responseFromNativeCode = 'Waiting for Response...';

  Future<void> responseFromNative()async{
    String response = '';
    try{
      final String result = await platform.invokeMethod('helloFromNativeCode');
      response = result;
    }on PlatformException catch(e){
      response = "Failed to Invoke: '${e.message}'.";
    }
    setState(() {
      _responseFromNativeCode = response;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Method Channel'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(onPressed: (){
              responseFromNative();
            },
                child: const Text('Call Native Method')),
            Text(_responseFromNativeCode)
          ],
        ),
      ),
    );
  }
}
