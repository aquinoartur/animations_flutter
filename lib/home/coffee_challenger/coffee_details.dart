import 'package:animations_flutter/home/coffee_challenger/coffe_model/coffee.dart';
import 'package:flutter/material.dart';

import 'coffe_model/coffee_list.dart';

class CoffeeDetails extends StatelessWidget {
  final Coffee coffee;

  const CoffeeDetails({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              customColor,
              customColor,
              Colors.white70,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Transform.scale(
                  scale: .6,
                  child: const BackButton(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  coffee.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Sunshine',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: size.height * 0.4,
                child: Hero(
                  tag: coffee.image,
                  child: Image.asset(
                    coffee.image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TweenAnimationBuilder<double>(
                duration: const Duration(seconds: 3),
                tween: Tween(
                  begin: 1.0,
                  end: 0.0,
                ),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(
                      0,
                      size.height * value,
                    ),
                    child: child,
                  );
                },
                child: Text(
                  'R\$${coffee.price.round().toStringAsFixed(2).replaceAll('.', ',')}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Sunshine',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
