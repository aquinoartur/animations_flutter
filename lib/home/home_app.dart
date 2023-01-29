import 'dart:math';

import 'package:animations_flutter/home/coffee_challenger/coffee_onboard.dart';
import 'package:animations_flutter/home/tween_animation_builder/tween_animation_example_one.dart';
import 'package:flutter/material.dart';

import 'animacoes_controladas/animacoes_controladas_one.dart';
import 'basic/basic_animation.dart';
import 'curves/curves_animation.dart';
import 'package:google_fonts/google_fonts.dart';

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
              color: Colors.purple,
            ),
            AnimationButton(
              text: 'Curved Animation',
              page: CurvesAnimation(),
              color: Colors.blueAccent,
            ),
            AnimationButton(
              text: 'Controlled Animations',
              page: AnimacoesControladasOne(),
              color: Colors.brown,
            ),
            AnimationButton(
              text: 'Tween Animation Builder',
              page: TweenAnimationBuilderExampleOne(),
              color: Colors.teal,
            ),
            AnimationButton(
              text: 'Coffe Challange - Diego Developer',
              page: CoffeeOnboard(),
              color: Colors.green,
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
  final Color? color;

  const AnimationButton({
    super.key,
    required this.text,
    required this.page,
    this.color,
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
      style: ElevatedButton.styleFrom(
        backgroundColor: color ??
            Colors.primaries[Random().nextInt(
              Colors.primaries.length,
            )],
      ),
      child: Text(
        text,
        style: GoogleFonts.heebo(
          color: Colors.white,
        ),
      ),
    );
  }
}
