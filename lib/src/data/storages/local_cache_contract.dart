import 'dart:async';

/// Defines a contract to local cache implementations
abstract interface class LocalCacheContract<T> {
  /// Returns the data from the local cache.
  FutureOr<T?> get(String key);

  /// Saves the data to the local cache.
  FutureOr<void> save(String key, T data);

  /// Removes the data from the local cache.
  FutureOr<void> remove(String key);
}
