import 'dart:async';

import 'package:bemol_test/app/core/dependency_injection.dart';
import 'package:bemol_test/src/data/storages/storages.dart';
import 'package:bemol_test/src/domain/entities/entity.dart';
import 'package:bemol_test/src/domain/entities/product.dart';
import 'package:bemol_test/src/domain/failures/failure.dart';
import 'package:bemol_test/src/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class SetProductAsFavorite implements UseCase<Failure, void, Product> {
  final _cache = dependencies.get<LocalCacheContract>();

  @override
  FutureOr<Either<Failure, void>> call(Product product) async {
    try {
      final products = await _cache.get<List<Product>>(CacheKeys.productsKey);

      if (products.isNotNull && products!.isNotEmpty) {
        final index = products.indexWhere((item) => item.id == product.id);

        if (index != -1) {
          products.removeAt(index);

          await _cache.save(
            CacheKeys.productsKey,
            products,
          );
        }
      }

      const favKey = CacheKeys.favoritesKey;
      final favorites = await _cache.get<List<Product>>(favKey);

      if (favorites.isNull) {
        await _cache.save(
          favKey,
          [product],
        );
      } else {
        favorites!.add(product);

        await _cache.save(
          favKey,
          favorites,
        );
      }

      return right(null);
    } catch (_) {
      return left(const Failure());
    }
  }
}
