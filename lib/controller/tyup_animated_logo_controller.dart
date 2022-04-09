import 'package:flutter/material.dart';

class TyupAnimatedLogoController {
  AnimationController? animationController;

  void dispose() {
    animationController?.dispose();
  }

  void stopAnimation() {
    animationController?.stop();
  }

  void resetAnimation() {
    animationController?.reset();
  }

  TickerFuture? repeatAnimation({
    double? min,
    double? max,
    bool reverse = false,
    Duration? period,
  }) {
    return animationController?.repeat(
      min: min,
      max: max,
      reverse: reverse,
      period: period,
    );
  }

  TickerFuture? reverseAnimation({double? from}) {
    return animationController?.reverse(from: from);
  }

  TickerFuture? forwardAnimation({double? from}) {
    return animationController?.forward(from: from);
  }

  TickerFuture? animateTo(
    double target, {
    Duration? duration,
    Curve curve = Curves.linear,
  }) {
    return animationController?.animateTo(
      target,
      duration: duration,
      curve: curve,
    );
  }
}
