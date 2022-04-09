import 'package:flutter/material.dart';

class TY extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;

    Path ty = Path();
    ty.moveTo(w * 0.3562985, h * 0.6325000);
    ty.lineTo(w * 0.3562985, h * 0.7291667);
    ty.lineTo(w * 0.2731940, h * 0.7291667);
    ty.cubicTo(
      w * 0.2139701,
      h * 0.7291667,
      w * 0.1678015,
      h * 0.7191667,
      w * 0.1346866,
      h * 0.6991667,
    );

    ty.cubicTo(
      w * 0.1015721,
      h * 0.6787219,
      w * 0.08501493,
      h * 0.6456115,
      w * 0.08501493,
      h * 0.5998333,
    );

    ty.lineTo(w * 0.08501493, h * 0.4518333);
    ty.lineTo(w * 0.02005970, h * 0.4518333);
    ty.lineTo(w * 0.02005970, h * 0.3571667);
    ty.lineTo(w * 0.08501493, h * 0.3571667);
    ty.lineTo(w * 0.08501493, h * 0.2665000);
    ty.lineTo(w * 0.2483582, h * 0.2665000);
    ty.lineTo(w * 0.2483582, h * 0.3571667);
    ty.lineTo(w * 0.3553433, h * 0.3571667);
    ty.lineTo(w * 0.3553433, h * 0.4518333);
    ty.lineTo(w * 0.2483582, h * 0.4518333);
    ty.lineTo(w * 0.2483582, h * 0.6011667);
    ty.cubicTo(
      w * 0.2483582,
      h * 0.6122781,
      w * 0.2521791,
      h * 0.6202781,
      w * 0.2598209,
      h * 0.6251667,
    );
    ty.cubicTo(
      w * 0.2674627,
      h * 0.6300552,
      w * 0.2801985,
      h * 0.6325000,
      w * 0.2980299,
      h * 0.6325000,
    );
    ty.lineTo(w * 0.3562985, h * 0.6325000);
    ty.close();
    ty.moveTo(w * 0.9917612, h * 0.3571667);
    ty.lineTo(w * 0.6574328, h * 0.9058333);
    ty.lineTo(w * 0.4816716, h * 0.9058333);
    ty.lineTo(w * 0.6039403, h * 0.7165000);
    ty.lineTo(w * 0.3871045, h * 0.3571667);
    ty.lineTo(w * 0.5695522, h * 0.3571667);
    ty.lineTo(w * 0.6927761, h * 0.5898333);
    ty.lineTo(w * 0.8150448, h * 0.3571667);
    ty.lineTo(w * 0.9917612, h * 0.3571667);
    ty.close();

    return ty;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
