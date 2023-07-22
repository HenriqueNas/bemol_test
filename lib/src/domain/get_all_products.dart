import 'dart:async';

import 'package:bemol_test/src/domain/product.dart';
import 'package:bemol_test/src/domain/use_case.dart';
import 'package:dartz/dartz.dart';

class GetAllProducts implements UseCase<Exception, List<Product>, void> {
  @override
  FutureOr<Either<Exception, List<Product>>> call(void param) {
    throw UnimplementedError();
  }
}
