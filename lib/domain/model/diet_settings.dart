class DietSettings {
  final int food;
  final int recommendedfood;
  final bool alarmEnabled;

  DietSettings({
    required this.food,
    required this.recommendedfood,
    required this.alarmEnabled,
  });

  factory DietSettings.initial() {
    return DietSettings(
      food: 0,
      recommendedfood: 100,
      alarmEnabled: true,
    );
  }

  factory DietSettings.fromMap(Map map) {
    return DietSettings(
      food: map["food"],
      recommendedfood: map["recommendedfood"],
      alarmEnabled: map["alarmEnabled"],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DietSettings &&
        other.food == food &&
        other.recommendedfood == recommendedfood &&
        other.alarmEnabled == alarmEnabled;
  }

  @override
  int get hashCode =>
      food.hashCode ^
      recommendedfood.hashCode ^
      alarmEnabled.hashCode;
}
