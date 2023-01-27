import 'package:flutter/material.dart';

import 'basic/basic_animation.dart';
import 'coffe_challanger/coffe_onboard.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              text: 'Coffe Challange - Diego Developer',
              page: CoffeOnboard(),
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
