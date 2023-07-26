abstract interface class Entity {
  bool get isValid => true;

  /// Try to cast [value] to [int] or [double] and return [double] value.
  static double intOrDoubleToDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    } else {
      throw Exception('Value is not int or double');
    }
  }
}

extension NullableObject on Object? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}
