library tyup_animated_logo;

import 'package:flutter/material.dart';
import 'package:tyup_animated_logo/controller/tyup_animated_logo_controller.dart';
import 'package:tyup_animated_logo/painter/foreground_painter.dart';
import 'package:tyup_animated_logo/painter/painter.dart';

export 'package:tyup_animated_logo/controller/tyup_animated_logo_controller.dart';

class TyupAnimatedLogo extends StatefulWidget {
  /// TyupAnimatedLogo is a widget that animates Tyup logo.
  const TyupAnimatedLogo({
    Key? key,
    required this.controller,
    required this.width,
    this.duration = const Duration(seconds: 5),
    this.repeat = false,
    this.scaleFactor = 1.414,
    this.tyFillColor,
    this.yBarFillColor,
    this.tyStrokeColor,
    this.yBarStrokeColor,
    this.tyStrokeWidth,
    this.yBarStrokeWidth,
  }) : super(key: key);

  /// Animation Controller for Tyup Logo
  final TyupAnimatedLogoController controller;

  /// Duration for Tyup Logo for animation
  /// This value is also used for repeat
  final Duration duration;

  /// Repeat animation
  final bool repeat;

  /// Width for Tyup Logo
  final double width;

  /// The scale factor is used to scale the size of the child
  /// to the size of the TyupAnimatedLogo.
  /// The default value is 1.0
  final double scaleFactor;

  /// ty shape stroke color
  final Color? tyStrokeColor;

  /// ty shape fill color
  final Color? tyFillColor;

  /// ty shape stroke width
  final double? tyStrokeWidth;

  /// yBar shape stroke width
  final double? yBarStrokeWidth;

  /// yBar Fill Color
  final Color? yBarFillColor;

  /// yBar Stroke Color
  final Color? yBarStrokeColor;

  @override
  State<TyupAnimatedLogo> createState() => _TyupAnimatedLogoState();
}

class _TyupAnimatedLogoState extends State<TyupAnimatedLogo>
    with SingleTickerProviderStateMixin {
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    widget.controller.animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    if (widget.repeat) {
      widget.controller.repeatAnimation(
        period: const Duration(seconds: 10),
      );
    } else {
      // widget binding postframecallback
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        widget.controller.forwardAnimation();
      });
    }
  }

  @override
  void dispose() {
    widget.controller.stopAnimation();
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TyupAnimatedLogoPainter(
        controller: widget.controller.animationController!,
      ),
      foregroundPainter: TyupAnimatedLogoForegroundPainter(),
      child: SizedBox(
        width: widget.width,
        height: widget.scaleFactor * widget.width,
      ),
    );
  }
}
