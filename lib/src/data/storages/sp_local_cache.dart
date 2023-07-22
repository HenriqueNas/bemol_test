import 'dart:async';
import 'dart:convert';

import 'package:bemol_test/src/data/storages/local_cache_contract.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef CacheMap = Map<String, dynamic>;

class SPLocalCache implements LocalCacheContract<CacheMap> {
  @override
  FutureOr<CacheMap?> get(String key) async {
    final cache = await SharedPreferences.getInstance();
    final object = cache.getString(key);

    if (object == null) return null;

    try {
      final decodedObject = jsonDecode(object);

      return decodedObject as CacheMap;
    } catch (_) {
      return null;
    }
  }

  @override
  FutureOr<void> remove(String key) async {
    final cache = await SharedPreferences.getInstance();

    await cache.remove(key);
  }

  @override
  FutureOr<void> save(String key, CacheMap data) async {
    final cache = await SharedPreferences.getInstance();
    final encodedData = jsonEncode(data);

    await cache.setString(key, encodedData);
  }
}