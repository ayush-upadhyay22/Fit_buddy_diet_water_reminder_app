import 'package:flutter/material.dart';
import 'package:waterreminder/resources/app_symbols.dart';

class DietInput {
  final int food;
  final IconData icon;
  final Color backgroundColor;

  DietInput({
    required this.food,
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
          food: 25,
          icon: AppSymbols.restaurant,
          backgroundColor: Color(0xFFF1EEFF),
        );
}

class _Regular extends DietInput {
  _Regular()
      : super(
          food: 25,
          icon: AppSymbols.restaurant,
          backgroundColor: Color(0xFFF8F8F6),
        );
}

class _Medium extends DietInput {
  _Medium()
      : super(
          food: 25,
          icon: AppSymbols.restaurant,
          backgroundColor: Color(0xFFFFFAEC),
        );
}

class _Large extends DietInput {
  _Large()
      : super(
          food: 25,
          icon: AppSymbols.restaurant,
          backgroundColor: Color(0xFFFBE9E3),
        );
}
