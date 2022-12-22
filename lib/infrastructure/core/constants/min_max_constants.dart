import 'package:flutter/material.dart';

const double marginLat = 16.0;
const double marginTop = 8.0;
const EdgeInsets generalMarginView = EdgeInsets.only(left: marginLat, right: marginLat, top: marginTop, bottom: marginTop);


///MinMaxConstant: Enum for Min or Max for inputs
enum MinMaxConstant {
  minLengthUserName,
  maxLengthUserName,
  minLengthPassword,
  maxLengthPassword,


}

extension MinMaxConstantExtension on MinMaxConstant {

  int get value {

    switch(this) {

      case MinMaxConstant.minLengthUserName:
        return 3;

      case MinMaxConstant.maxLengthUserName:
        return 50;

      case MinMaxConstant.minLengthPassword:
        return 6;

      case MinMaxConstant.maxLengthPassword:
        return 255;
    }
  }

}