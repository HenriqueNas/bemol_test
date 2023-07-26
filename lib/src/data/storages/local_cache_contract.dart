import 'dart:async';

/// Defines a contract to local cache implementations
abstract interface class LocalCacheContract {
  /// Returns the data from the local cache.
  FutureOr<T?> get<T>(String key);

  /// Saves the data to the local cache.
  FutureOr<void> save<T>(String key, T data);

  /// Removes the data from the local cache.
  FutureOr<void> remove(String key);
}
