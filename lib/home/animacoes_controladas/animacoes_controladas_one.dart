import 'dart:math';

import 'package:flutter/material.dart';

class AnimacoesControladasOne extends StatefulWidget {
  const AnimacoesControladasOne({super.key});

  @override
  State<AnimacoesControladasOne> createState() => _AnimacoesControladasOneState();
}

class _AnimacoesControladasOneState extends State<AnimacoesControladasOne>
    with TickerProviderStateMixin {
  late final AnimationController headerController;
  late final AnimationController descriptionController;

  late final Animation descriptionAnimation;

  @override
  void initState() {
    super.initState();
    headerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();

    descriptionController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    descriptionAnimation = CurvedAnimation(
      parent: descriptionController,
      curve: Curves.elasticInOut,
    );
  }

  void forward() {
    headerController.forward(from: 0.0);
    descriptionController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animações Explícitas'),
          actions: [
            IconButton(
              onPressed: forward,
              icon: const Icon(Icons.refresh, color: Colors.green),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: headerController,
              child: const Text('Artur Aquino - Flutter Developer'),
              builder: (context, child) {
                return Center(
                  child: GestureDetector(
                    onTap: () => headerController.forward(from: 0.0),
                    child: Transform.translate(
                      offset: Offset(
                        -size.width * (1 - headerController.value),
                        -size.height * 0.5 * (1 - headerController.value),
                      ),
                      child: child,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            Center(
              child: AnimatedBuilder(
                animation: headerController,
                child: Transform.rotate(
                  angle: 3 * pi / 2,
                  child: GestureDetector(
                    onTap: () => headerController.forward(from: 0.0),
                    child: FlutterLogo(
                      style: FlutterLogoStyle.stacked,
                      size: size.height * 0.2,
                    ),
                  ),
                ),
                builder: (context, child) {
                  return Transform.rotate(
                    angle: pi / (headerController.value + 1),
                    child: Opacity(
                      opacity: headerController.value,
                      child: child,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: AnimatedBuilder(
                animation: descriptionAnimation,
                child: GestureDetector(
                  onTap: () {
                    descriptionController.forward(from: 0.0);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    ),
                  ),
                ),
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                      0.0,
                      size.height * 0.5 * (1 - descriptionAnimation.value),
                    ),
                    child: child,
                  );
                },
              ),
            ),
          ],
        ));
  }
}
