import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TweenAnimationBuilderExampleTwo extends StatefulWidget {
  const TweenAnimationBuilderExampleTwo({super.key});

  @override
  State<TweenAnimationBuilderExampleTwo> createState() => _TweenAnimationBuilderExampleTwoState();
}

class _TweenAnimationBuilderExampleTwoState extends State<TweenAnimationBuilderExampleTwo> {
  ValueNotifier<int> count = ValueNotifier(0);
  ValueNotifier<int?> oldCount = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tween Animation Builder'),
        actions: [
          IconButton(
            onPressed: () {
              oldCount.value = count.value;
              count.value++;
            },
            icon: const Icon(Icons.add, color: Colors.green),
          )
        ],
      ),
      body: AnimatedBuilder(
          animation: count,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 1.0, end: 0.0),
                  key: Key(count.value.toString()),
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOutCirc,
                  builder: (context, factor, child) {
                    return Stack(
                      children: [
                        if (oldCount.value != null)
                          Center(
                            child: Transform.translate(
                              offset: Offset(
                                0.0,
                                size.height * (1.0 - factor),
                              ),
                              child: Opacity(
                                opacity: factor,
                                child: Text(
                                  oldCount.value.toString(),
                                  style: GoogleFonts.heebo(fontSize: 80),
                                ),
                              ),
                            ),
                          ),
                        Center(
                          child: Transform.translate(
                            offset: Offset(size.width * factor, 0.0),
                            child: Opacity(
                              opacity: 1.0 - factor,
                              child: Text(
                                count.value.toString(),
                                style: GoogleFonts.heebo(fontSize: 80),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            );
          }),
    );
  }
}
