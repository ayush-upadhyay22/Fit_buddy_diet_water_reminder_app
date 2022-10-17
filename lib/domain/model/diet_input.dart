import 'package:flutter/material.dart';
import 'package:waterreminder/resources/app_symbols.dart';

class DietInput {
  final int milliliters;
  final IconData icon;
  final Color backgroundColor;

  DietInput({
    required this.milliliters,
    required this.icon,
    required this.backgroundColor,
  });

  factory DietInput.small() = _Small;
  factory DietInput.regular() = _Regular;
  factory DietInput.medium() = _Medium;
  factory DietInput.large() = _Large;
}

class _Small extends DietInput {
  _Small()
      : super(
          milliliters: 500,
          icon: AppSymbols.coffee_cup,
          backgroundColor: Color(0xFFF1EEFF),
        );
}

class _Regular extends DietInput {
  _Regular()
      : super(
          milliliters: 500,
          icon: AppSymbols.water_glass,
          backgroundColor: Color(0xFFF8F8F6),
        );
}

class _Medium extends DietInput {
  _Medium()
      : super(
          milliliters: 500,
          icon: AppSymbols.water,
          backgroundColor: Color(0xFFFFFAEC),
        );
}

class _Large extends DietInput {
  _Large()
      : super(
          milliliters: 500,
          icon: AppSymbols.jug,
          backgroundColor: Color(0xFFFBE9E3),
        );
}
