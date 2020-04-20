import 'package:flutter/material.dart';

class ButtonCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var middleHeight = size.height / 2;
    var percentageWidth = size.width * 0.15;
    final path = Path()
      ..lineTo(0.0, middleHeight)
      ..lineTo(0.0, middleHeight)
      ..lineTo(percentageWidth, size.height)
      ..lineTo(size.width - percentageWidth, size.height)
      ..lineTo(size.width, middleHeight)
      ..lineTo(size.width, middleHeight)
      ..lineTo(size.width - percentageWidth, 0.0)
      ..lineTo(percentageWidth, 0.0)
      ..lineTo(0.0, middleHeight)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
