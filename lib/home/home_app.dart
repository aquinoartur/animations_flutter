import 'package:animations_flutter/home/coffee_challenger/coffee_onboard.dart';
import 'package:animations_flutter/home/tween_animation_builder/tween_animation_example_one.dart';
import 'package:flutter/material.dart';

import 'basic/basic_animation.dart';
import 'curves/curves_animation.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My animation studies',
          style: TextStyle(fontFamily: "Sunshine"),
        ),
      ),
      body: Center(
        child: ListView(
          children: const [
            AnimationButton(
              text: 'Basic Animation',
              page: BasicAnimation(),
            ),
            AnimationButton(
              text: 'Curved Animation',
              page: CurvesAnimation(),
            ),
            AnimationButton(
              text: 'Tween Animation Builder',
              page: TweenAnimationBuilderExampleOne(),
            ),
            AnimationButton(
              text: 'Coffe Challange - Diego Developer',
              page: CoffeeOnboard(),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimationButton extends StatelessWidget {
  final String text;
  final Widget page;

  const AnimationButton({
    super.key,
    required this.text,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: Text(text),
    );
  }
}
