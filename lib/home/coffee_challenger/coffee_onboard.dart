import 'package:animations_flutter/home/coffee_challenger/coffe_model/coffee.dart';
import 'package:flutter/material.dart';

import 'coffee_list.dart';

class CoffeeOnboard extends StatefulWidget {
  const CoffeeOnboard({super.key});

  @override
  State<CoffeeOnboard> createState() => _CoffeeOnboardState();
}

class _CoffeeOnboardState extends State<CoffeeOnboard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onDoubleTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return FadeTransition(
                  opacity: animation,
                  child: const CoffeeList(),
                );
              },
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.expand(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      customColor,
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: size.height * 0.15,
              height: size.height * 0.4,
              child: Hero(
                tag: coffeeLsit[6].image,
                child: Image.asset(
                  coffeeLsit[6].image,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: size.height * 0.7,
              child: Hero(
                tag: coffeeLsit[7].image,
                child: Image.asset(
                  coffeeLsit[7].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              height: size.height,
              bottom: -size.height * 0.8,
              child: Hero(
                tag: coffeeLsit[8].image,
                child: Image.asset(
                  coffeeLsit[8].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              height: 140,
              bottom: size.height * 0.25,
              child: const Text(
                ' Flutter Coffee',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 145, 117, 107),
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Sunshine',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
