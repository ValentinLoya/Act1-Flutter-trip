import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart'; // Necesario para las animaciones multitrack

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  
  const FadeAnimation({
    Key? key,
    required this.delay,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        'opacity',
        0.0.tweenTo(1.0),
        duration: 500.milliseconds,
        curve: Curves.easeOut,
      )
      ..tween(
        'translateY',
        120.0.tweenTo(0.0),
        duration: 500.milliseconds,
        curve: Curves.easeOut,
      );

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, value, child) {
        return Opacity(
          opacity: value.get<double>('opacity'),
          child: Transform.translate(
            offset: Offset(0, value.get<double>('translateY')),
            child: child,
          ),
        );
      },
    );
  }
}