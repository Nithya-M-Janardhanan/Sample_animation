
import 'package:flutter/material.dart';

extension ExtendedString on String{
  get firstLetterToUpperCase{
    if(this != null){
      return this[0].toUpperCase() + this.substring(1);
    }
    return null;
  }
}

extension ExtendedWidget on Widget {
  Container addBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      color: Colors.green,
      child: this,
    );
  }
}

extension ExtendedText on Text{
  Text setBiggerText(){
    return Text(
      data!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.deepPurple),
    );
  }
}
