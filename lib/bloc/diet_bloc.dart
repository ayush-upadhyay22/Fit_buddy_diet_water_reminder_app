import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waterreminder/domain/model/diet_input.dart';
import 'package:waterreminder/domain/model/diet_settings.dart';
import 'package:waterreminder/domain/repository/diet_repository.dart';

class DietBloc extends Cubit<DietSettings> {
  DietBloc(this._repository) : super(DietSettings.initial()) {
    _subscription = _repository.waterSettings.listen((event) {
      emit(event);
    });
  }

  final DietRepository _repository;
  StreamSubscription? _subscription;

  int get currentWater => state.currentMilliliters;
  int get remainigWater =>
      state.currentMilliliters <= state.recommendedMilliliters
          ? state.recommendedMilliliters - state.currentMilliliters
          : 0;
  double get progress =>
      state.currentMilliliters / state.recommendedMilliliters;

  Future<void> drinkWater(DietInput input) async {
    _repository.drinkWater(input.milliliters);
  }

  void changeAlarmEnabled(bool enabled) {
    _repository.changeAlarmEnabled(enabled);
  }

  void setRecommendedMilliliters(int milliliters) {
    _repository.setRecommendedMilliliters(milliliters);
  }

  void clearDataStore() {
    _repository.clearDataStore();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
