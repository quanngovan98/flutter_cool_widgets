import 'dart:math';

import 'package:flutter/material.dart';

class Utils {
  static Utils _utils;
  factory Utils() {
    if(_utils == null) {
      _utils = Utils._();
    }
    return _utils;
  }
  Utils._();
  static const Color one = Colors.blue;
  static const Color two = Colors.red;
  static const Color three = Colors.yellow;
  static const Color four = Colors.pink;
  static const Color five = Colors.green;

  List<Color> hexColor = [one, two, three, four, five];

  static final _random = Random();

  Color colorRandom() {
    return hexColor[_random.nextInt(5)];
  }
  Widget buildButton({int index, String text, Function onTap, double margin = 10, Key key, double width}) {
    return Container(
      key: key??UniqueKey(),
      decoration: BoxDecoration(
          color: index!=null ? hexColor[index%5] : colorRandom(), borderRadius: BorderRadius.circular(10)),
      width: width ?? double.maxFinite,
      margin: EdgeInsets.only(top: 10, right: margin, left: margin),
      height: 60,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}