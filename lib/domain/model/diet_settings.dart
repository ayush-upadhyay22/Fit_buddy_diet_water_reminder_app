class DietSettings {
  final int currentMilliliters;
  final int recommendedMilliliters;
  final bool alarmEnabled;

  DietSettings({
    required this.currentMilliliters,
    required this.recommendedMilliliters,
    required this.alarmEnabled,
  });

  factory DietSettings.initial() {
    return DietSettings(
      currentMilliliters: 0,
      recommendedMilliliters: 2000,
      alarmEnabled: true,
    );
  }

  factory DietSettings.fromMap(Map map) {
    return DietSettings(
      currentMilliliters: map["currentMilliliters"],
      recommendedMilliliters: map["recommendedMilliliters"],
      alarmEnabled: map["alarmEnabled"],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DietSettings &&
        other.currentMilliliters == currentMilliliters &&
        other.recommendedMilliliters == recommendedMilliliters &&
        other.alarmEnabled == alarmEnabled;
  }

  @override
  int get hashCode =>
      currentMilliliters.hashCode ^
      recommendedMilliliters.hashCode ^
      alarmEnabled.hashCode;
}
