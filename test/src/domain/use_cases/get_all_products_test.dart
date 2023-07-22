import 'dart:async';
import 'dart:io';

import 'package:bemol_test/app/app.dart';
import 'package:bemol_test/src/data/http/http.dart';
import 'package:bemol_test/src/domain/entities/product.dart';
import 'package:bemol_test/src/domain/use_cases/get_all_products.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(
    () => {
      dependencies.register<HttpClientContract>(_MockHttpClient()),
    },
  );

  testWidgets(
    'when try to get all products, should return a non empty List<Products>',
    (tester) async {
      final getAllProducts = GetAllProducts();
      final result = await getAllProducts();

      expect(result.isRight(), isTrue);

      final products = result.getOrElse(() => []);
      expect(products, isA<List<Product>>());
    },
  );
}

class _MockHttpClient implements HttpClientContract<_MockHttpResponseContract> {
  @override
  FutureOr<_MockHttpResponseContract> get<T>(String url) {
    return const _MockHttpResponseContract(
      data: <Product>[],
      statusCode: HttpStatus.ok,
    );
  }

  @override
  FutureOr<_MockHttpResponseContract> post<T>(
    String url, {
    Map<String, dynamic>? data,
  }) {
    throw UnimplementedError();
  }
}

class _MockHttpResponseContract implements HttpResponseContract {
  const _MockHttpResponseContract({
    required this.data,
    required this.statusCode,
  });

  @override
  final dynamic data;

  @override
  final int statusCode;
}
