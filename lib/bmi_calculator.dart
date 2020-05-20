

import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculateBMI {
  CalculateBMI({@required this.weight,this.height});
  final int height;

  final int weight;
  double _bmiVal = 0;

  String Calculate() {
    _bmiVal = weight / pow(height/100, 2);

return _bmiVal.toStringAsFixed(1);
  }
  String getResult() {
    if(_bmiVal >= 25) {
return 'OVERWEIGHT';
    } else if(_bmiVal > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDER WEIGHT';

    }
  }
  String getInterpretaion() {
    if(_bmiVal >= 25) {
      return 'Need to Exercise more...';
    } else if(_bmiVal > 18.5) {
      return 'You are Perfect';
    } else {
      return 'Eat something';

    }
  }
}