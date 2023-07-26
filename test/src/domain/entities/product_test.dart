import 'package:bemol_test/src/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('products instances with same id should be equal', () {
    const id = 1;

    const product1 = Product(id: id);
    const product2 = Product(id: id);

    expect(product1, product2);
  });

  test('products instances with different id should not be equal', () {
    const product1 = Product(id: 2);
    const product2 = Product(id: 3);

    expect(product1, isNot(product2));
  });

  test('products without id should not be valid', () {
    const product = Product();

    expect(product.isValid, isFalse);
  });
}
