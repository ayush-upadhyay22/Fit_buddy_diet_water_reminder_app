import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:waterreminder/bloc/diet_bloc.dart';
import 'package:waterreminder/ui/hydration_pool/diet_quantity_text.dart';
import 'package:waterreminder/ui/hydration_pool/diet_person_view.dart';
import 'package:waterreminder/ui/hydration_pool/remaining_diet_text.dart';
import 'package:waterreminder/ui/hydration_pool/diet_view.dart';

class DietPoolPage extends StatefulWidget {
  @override
  _DietPoolPageState createState() => _DietPoolPageState();
}

class _DietPoolPageState extends State<DietPoolPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<DietBloc>();

    return Stack(
      children: [
        Align(
          alignment: Alignment(0.0, -0.1),
          child: DietPersonView(animation: _controller),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: DietView(
            animation: _controller,
            progress: bloc.progress,
          ),
        ),
        Align(
          alignment: Alignment(0.0, -0.68),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              DietQuantityText(bloc.currentWater),
              SizedBox(height: 8),
              RemainingDietText(bloc.remainigWater),
            ],
          ),
        ),
      ],
    );
  }
}
