import 'package:flutter/material.dart';

class YBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;

    Path yBar = Path();
    yBar.moveTo(w * 0.3805970, h * 0.2604167);
    yBar.lineTo(w * 0.9925373, h * 0.2604167);

    return yBar;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
