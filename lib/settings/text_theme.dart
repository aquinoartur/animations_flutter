import 'package:flutter/material.dart';

extension ThemeDataExtension on BuildContext {
  /// Contains the ThemeData instance.
  ThemeData get theme {
    return Theme.of(this);
  }

  /// fontSize: 12.0,
  TextStyle get body1 {
    return Theme.of(this).textTheme.bodyText1!;
  }

  TextStyle get body2 {
    return Theme.of(this).textTheme.bodyText1!;
  }

  TextStyle get button {
    return Theme.of(this).textTheme.button!;
  }

  /// fontSize: 26.00,
  /// fontWeight: FontWeight.w700
  TextStyle get h1 {
    return Theme.of(this).textTheme.headline1!;
  }

  /// fontSize: 22.0,
  /// fontWeight: FontWeight.w700
  TextStyle get h2 {
    return Theme.of(this).textTheme.headline2!;
  }

  /// fontSize: 19.0,
  /// fontWeight: FontWeight.w700
  TextStyle get h3 {
    return Theme.of(this).textTheme.headline3!;
  }

  ///fontSize: 17.0,
  ///fontWeight: FontWeight.w700
  TextStyle get h4 {
    return Theme.of(this).textTheme.headline4!;
  }

  /// fontSize: 15.0,
  /// fontWeight: FontWeight.w700
  TextStyle get h5 {
    return Theme.of(this).textTheme.headline5!;
  }

  /// fontSize: 14.0,
  /// fontWeight: FontWeight.w500
  TextStyle get h6 {
    return Theme.of(this).textTheme.headline6!;
  }
}
