import 'package:flutter/material.dart';

class CurvesAnimation extends StatefulWidget {
  const CurvesAnimation({Key? key}) : super(key: key);

  @override
  State<CurvesAnimation> createState() => _CurvesAnimationState();
}

class _CurvesAnimationState extends State<CurvesAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;
  late Animation<double> _animation4;

  void setAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      _controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _animation1 = CurvedAnimation(parent: _controller, curve: Curves.bounceIn)..addStatusListener(setAnimationStatus);
    _animation2 = CurvedAnimation(parent: _controller, curve: Curves.bounceOut)..addStatusListener(setAnimationStatus);
    _animation3 = CurvedAnimation(parent: _controller, curve: Curves.decelerate)..addStatusListener(setAnimationStatus);
    _animation4 = CurvedAnimation(parent: _controller, curve: Curves.easeIn)..addStatusListener(setAnimationStatus);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimationCurved(
              animation: _animation1,
              child: const FlutterLogo(),
            ),
            if (_animation1.isDismissed) ...{
              AnimationCurved(
                animation: _animation2,
                child: const FlutterLogo(),
              ),
              AnimationCurved(
                animation: _animation3,
                child: const FlutterLogo(),
              ),
              AnimationCurved(
                animation: _animation4,
                child: const FlutterLogo(),
              ),
            },
          ],
        ),
      ),
    );
  }
}

class AnimationCurved extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  AnimationCurved({Key? key, required this.animation, required this.child}) : super(key: key);

  final Tween<double> sizeAnimation = Tween<double>(begin: 0.0, end: 150);
  final Tween<double> opacityAnimation = Tween<double>(begin: 0.1, end: 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30.0),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Opacity(
            opacity: opacityAnimation.evaluate(animation).clamp(0.0, 1.0),
            child: SizedBox(
              height: sizeAnimation.evaluate(animation),
              width: sizeAnimation.evaluate(animation),
              child: this.child,
            ),
          );
        },
      ),
    );
  }
}
