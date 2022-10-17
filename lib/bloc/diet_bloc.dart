import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterreminder/domain/model/diet_input.dart';
import 'package:waterreminder/domain/model/diet_settings.dart';
import 'package:waterreminder/domain/repository/diet_repository.dart';

class DietBloc extends Cubit<DietSettings> {
  DietBloc(this._repository) : super(DietSettings.initial()) {
    _subscription = _repository.dietSettings.listen((event) {
      emit(event);
    });
  }

  final DietRepository _repository;
  StreamSubscription? _subscription;

  int get food => state.food;
  int get remainigfood =>
      state.food <= state.recommendedfood
          ? state.recommendedfood - state.food
          : 0;
  double get progress =>
      state.food / state.recommendedfood;

  Future<void> diet(DietInput input) async {
    _repository.diet(input.food);
  }

  void changeAlarmEnabled(bool enabled) {
    _repository.changeAlarmEnabled(enabled);
  }

  void setRecommendedfood(int milliliters) {
    _repository.setRecommendedfood(milliliters);
  }

  void clearDataStore()  {
    _repository.clearDataStore();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
