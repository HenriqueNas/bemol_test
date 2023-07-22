import 'package:flutter/foundation.dart';

@immutable
class Failure implements Exception {
  const Failure([
    String? message,
  ]) : message = message ?? 'Unknown failure';

  final String message;

  @override
  String toString() => message;
}
