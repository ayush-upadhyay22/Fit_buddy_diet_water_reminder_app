import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:waterreminder/constant/constant.dart';
import 'package:waterreminder/data/platform/platform_messenger.dart';
import 'package:waterreminder/domain/model/diet_settings.dart';

class DietRepository {
  DietRepository() {
    PlatformMessenger.setMethodCallHandler((call) {
      switch (call.method) {
        case Constant.methodWaterSettingsChanged:
          _dietSettings.add(DietSettings.fromMap(call.arguments));
          break;
        default:
          break;
      }
      return Future.value(null);
    });
  }

  final _dietSettings = BehaviorSubject<DietSettings>();

  Stream<DietSettings> get dietSettings => _dietSettings.stream;

  void diet(int milliliters) {
    PlatformMessenger.invokeMethod(Constant.methodEatfood, milliliters);
  }

  void changeAlarmEnabled(bool enabled) {
    PlatformMessenger.invokeMethod(
        Constant.methodChangeNotificationEnabled, enabled);
  }

  void subscribeToDataStore() {
    PlatformMessenger.invokeMethod(Constant.methodSubscribeToDataStore);
  }

  void setRecommendedfood(int food) {
    PlatformMessenger.invokeMethod(
        Constant.methodSetRecommendedfood, food);
  }

  void clearDataStore() {
    PlatformMessenger.invokeMethod(Constant.methodClearDataStore);
  }

  void close() {
    _dietSettings.close();
  }
}
