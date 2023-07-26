import 'dart:async';

import 'package:bemol_test/app/core/dependency_injection.dart';
import 'package:bemol_test/src/data/storages/storages.dart';
import 'package:bemol_test/src/domain/entities/product.dart';
import 'package:bemol_test/src/domain/entities/rating.dart';
import 'package:bemol_test/src/domain/use_cases/set_product_as_favorite.dart';
import 'package:flutter_test/flutter_test.dart';

typedef ProductsList = List<Product>;

void main() {
  group('in memory local cache service tests', () {
    final cache = InMemoryLocalCache();

    const prodsKey = CacheKeys.productsKey;
    const favKey = CacheKeys.favoritesKey;

    const product = Product(
      id: 1,
      title: 'title',
      description: 'description',
      price: 1,
      imageUrl: 'image',
      category: 'category',
      rating: Rating(rate: 5, count: 10),
    );

    setUpAll(() {
      dependencies.register<LocalCacheContract>(cache);
    });

    setUp(() => cache.remove(prodsKey));

    test(
      '''
when set product as favorite, should remove product from the 
cache of products and add to the cache of favorites''',
      () async {
        cache.save(CacheKeys.productsKey, [product]);

        expect(
          await cache.get<ProductsList>(prodsKey) ?? [],
          isNotEmpty,
        );
        expect(
          await cache.get<ProductsList>(favKey) ?? [],
          isEmpty,
        );

        final setProductAsFavorite = SetProductAsFavorite();
        await setProductAsFavorite(product);

        final products = await cache.get<ProductsList>(prodsKey) ?? [];

        expect(products, isEmpty);

        final favorites = await cache.get<ProductsList>(CacheKeys.favoritesKey);

        expect(favorites, isNotEmpty);
        expect(favorites?.first, product);
      },
    );
  });
}

class InMemoryLocalCache implements LocalCacheContract {
  final _localCache = <String, dynamic>{};

  @override
  FutureOr<T?> get<T>(String key) {
    try {
      return _localCache[key] as T?;
    } catch (_) {
      return null;
    }
  }

  @override
  FutureOr<void> remove(String key) {
    _localCache.remove(key);
  }

  @override
  FutureOr<void> save<T>(String key, T data) {
    _localCache[key] = data;
  }
}
