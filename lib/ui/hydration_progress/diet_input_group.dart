import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterreminder/bloc/diet_bloc.dart';
import 'package:waterreminder/domain/model/diet_input.dart';
import 'package:waterreminder/ui/hydration_progress/diet_button.dart';

class DietInputGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void addInput(DietInput value) {
      context.read<DietBloc>().drinkWater(value);
    }

    return Wrap(
      children: [
        DietButton(
          input: DietInput.small(),
          onPressed: addInput,
        ),
        DietButton(
          input: DietInput.regular(),
          onPressed: addInput,
        ),
        DietButton(
          input: DietInput.medium(),
          onPressed: addInput,
        ),
        DietButton(
          input: DietInput.large(),
          onPressed: addInput,
        ),
      ],
    );
  }
}
