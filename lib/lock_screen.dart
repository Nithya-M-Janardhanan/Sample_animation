

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/lock_provider.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,title: const Text('Animation Sample'),),
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  context.read<LockProvider>().changeLockTapped(true);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: const Icon(Icons.lock_open),
                ),
              ),
              const SizedBox(width: 50,),
              context.read<LockProvider>().isLockTapped ?  Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: const Icon(Icons.lock_open),
              ) :
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey
                ),
                child: const Text('Start',textAlign: TextAlign.center,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
