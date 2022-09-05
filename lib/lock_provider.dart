import 'package:flutter/cupertino.dart';

class LockProvider extends ChangeNotifier{
  bool isLockTapped = false;

  changeLockTapped(bool val) async{
    isLockTapped = val;
    notifyListeners();
  }
}