import 'dart:math';

final Random random = Random();
double _doubleInRange(Random source, num start, num end) {
  return source.nextDouble() * (end - start) + start;
}

final coffeeLsit = List.generate(
  _names.length,
  (index) => Coffee(
    image: 'assets/${index + 1}.png',
    name: _names[index],
    price: _doubleInRange(random, 7, 15),
  ),
);

class Coffee {
  final String image;
  final String name;
  final double price;
  Coffee({
    required this.image,
    required this.name,
    required this.price,
  });
}

final _names = [
  'Caramel Cold Drink',
  'Iced Coffee Mocha',
  'Caramelize Pecan Latte',
  'Toffee Nut latte',
  'Capuchino',
  'Toffee Nut Iced Latte',
  'Americano',
  'Caramel Macchiato',
  'Vietnamese-Style Iced Coffee',
  'Black Tea Latte',
  'Classic Irish Coffee',
  'Toffee Nut Crunch Latte',
];
