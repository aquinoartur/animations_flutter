import 'dart:math';

import 'package:flutter/material.dart';

class TweenAnimationBuilderExampleTwo extends StatefulWidget {
  const TweenAnimationBuilderExampleTwo({super.key});

  @override
  State<TweenAnimationBuilderExampleTwo> createState() => _TweenAnimationBuilderExampleTwoState();
}

class _TweenAnimationBuilderExampleTwoState extends State<TweenAnimationBuilderExampleTwo> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tween Animation Builder'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 1.0, end: 0.0),
            duration: const Duration(seconds: 2),
            child: const Center(child: Text('Artur Aquino - Flutter Developer')),
            builder: (context, factor, child) {
              return Transform.translate(
                offset: Offset(
                  -size.width * factor,
                  -size.height * 0.5 * factor,
                ),
                child: child,
              );
            },
          ),
          const SizedBox(height: 30),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(seconds: 2),
            child: Center(
              child: Transform.rotate(
                angle: 3 * pi / 2,
                child: FlutterLogo(
                  textColor: Colors.green,
                  size: size.height * 0.2,
                ),
              ),
            ),
            builder: (context, factor, child) => Transform.rotate(
              angle: pi / (factor + 1),
              child: Opacity(
                opacity: factor,
                child: child,
              ),
            ),
          ),
          const SizedBox(height: 30),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 1.0, end: 0.0),
            duration: const Duration(seconds: 2),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                ),
              ),
            ),
            builder: (context, factor, child) {
              return Transform.translate(
                offset: Offset(
                  0.0,
                  size.height * 0.5 * factor,
                ),
                child: child,
              );
            },
          ),
        ],
      ),
    );
  }
}
