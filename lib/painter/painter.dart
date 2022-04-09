import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tyup_animated_logo/path/ty/ty.dart';
import 'package:tyup_animated_logo/path/ybar/ybar.dart';

class TyupAnimatedLogoPainter extends CustomPainter {
  const TyupAnimatedLogoPainter({
    required this.controller,
  }) : super(repaint: controller);

  final AnimationController controller;

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = controller.value;

    debugPrint("Painting + $animationPercent - $size");

    /************  Y Bar ************/
    Path yBar = YBar().getClip(size);

    Paint yBarStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.14;
    yBarStroke.color = Colors.blue;
    canvas.drawPath(yBar, yBarStroke);

    // Paint yBarFill = Paint()..style = PaintingStyle.fill;
    // yBarFill.color = Colors.blue;
    // canvas.drawPath(yBar, yBarFill);

    /************  Y Bar ************/

    /************  TY ************/
    Path ty = createAnimatedPath(TY().getClip(size), animationPercent);

    Paint tyPaint = Paint()..style = PaintingStyle.stroke;
    tyPaint.color = Colors.black.withOpacity(1.0);

    canvas.drawPath(ty, tyPaint);
    /************  TY ************/
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Path createAnimatedPath(
    Path originalPath,
    double animationPercent,
  ) {
    // ComputeMetrics can only be iterated once!
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(
    Path originalPath,
    double length,
  ) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        // Extract Path
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }
}
