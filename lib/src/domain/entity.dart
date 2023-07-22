abstract interface class Entity {
  bool get isValid;
}

extension NullableObject on Object? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}
