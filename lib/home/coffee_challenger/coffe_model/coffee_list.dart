import 'package:animations_flutter/home/coffee_challenger/coffe_model/coffee.dart';
import 'package:animations_flutter/home/coffee_challenger/coffee_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

double initialPage = 8.0;
const customColor = Color.fromARGB(255, 108, 90, 83);
const duration = Duration(milliseconds: 200);

class CoffeeList extends StatefulWidget {
  const CoffeeList({super.key});

  @override
  State<CoffeeList> createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  late final PageController pageController;
  double currentPage = initialPage;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      viewportFraction: 0.35,
      initialPage: initialPage.toInt(),
    );

    pageController.addListener(coffeePageListener);
  }

  @override
  void dispose() {
    pageController.removeListener(coffeePageListener);
    pageController.dispose();
    super.dispose();
  }

  void coffeePageListener() => setState(() => currentPage = pageController.page ?? 0.0);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var padding = MediaQuery.of(context).padding;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  customColor,
                ],
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: -size.height * 0.22,
                  height: size.height * 0.33,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.brown,
                          blurRadius: 90,
                          spreadRadius: 45,
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 1.4,
                  alignment: Alignment.bottomCenter,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: coffeeLsit.length + 1,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const SizedBox.shrink();
                      }

                      var coffee = coffeeLsit[index - 1];
                      final param = (currentPage - index) + 1;
                      final transformParam = -0.4 * param + 1;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..translate(
                              0.0,
                              size.height / 2.6 * (1 - transformParam.abs()),
                            )
                            ..scale(transformParam),
                          child: Opacity(
                            opacity: transformParam.clamp(0.0, 1.0),
                            child: Hero(
                              tag: coffee.image,
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
                                      opacity: animation,
                                      child: CoffeeDetails(coffee: coffee),
                                    ),
                                  ),
                                ),
                                child: Image.asset(
                                  coffee.image,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (currentPage.toInt() < coffeeLsit.length)
                  Positioned(
                    left: 0,
                    right: 0,
                    top: padding.top,
                    height: 100,
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: duration,
                        transitionBuilder: (child, animation) {
                          return SlideTransition(
                            position: animation.drive(
                              Tween(
                                begin: const Offset(1.0, 0.0),
                                end: const Offset(0.0, 0.0),
                              ),
                            ),
                            child: child,
                          );
                        },
                        child: Text(
                          coffeeLsit[currentPage.toInt()].name,
                          key: Key(coffeeLsit[currentPage.toInt()].name),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.brown,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Sunshine',
                          ),
                        ),
                      ),
                    ),
                  ),
                if (currentPage.toInt() < coffeeLsit.length)
                  Positioned(
                    left: 0,
                    right: 0,
                    top: padding.top * 2,
                    height: 100,
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: duration,
                        child: Text(
                          'R\$${coffeeLsit[currentPage.toInt()].price.round().toStringAsFixed(2).replaceAll('.', ',')}',
                          key: Key('${coffeeLsit[currentPage.toInt()].price}'),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'Sunshine',
                          ),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(top: padding.top),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Transform.scale(
                      scale: .6,
                      child: const BackButton(
                        color: customColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
