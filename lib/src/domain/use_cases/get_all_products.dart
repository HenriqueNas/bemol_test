import 'dart:async';

import 'package:bemol_test/app/core/dependency_injection.dart';
import 'package:bemol_test/src/data/http/http.dart';
import 'package:bemol_test/src/domain/entities/product.dart';
import 'package:bemol_test/src/domain/failures/products_failure.dart';
import 'package:bemol_test/src/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class GetAllProducts implements UseCase<ProductsFailure, List<Product>, void> {
  final _http = dependencies.get<HttpClientContract>();

  @override
  FutureOr<Either<ProductsFailure, List<Product>>> call(void param) async {
    try {
      final result = await _http.get<List<dynamic>>('/products');

      final listOfMap = (result.data as List) //
          .whereType<Map<String, dynamic>>();

      final products = listOfMap.map(Product.fromMap).toList();

      return right(products);
    } catch (_) {
      return left(const NoProductsFoundFailure());
    }
  }
}
