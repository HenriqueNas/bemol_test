import 'package:bemol_test/src/domain/failures/failure.dart';

sealed class ProductsFailure extends Failure {
  const ProductsFailure(String super.message);
}

class NoProductsFoundFailure extends ProductsFailure {
  const NoProductsFoundFailure() : super('No products found');
}
