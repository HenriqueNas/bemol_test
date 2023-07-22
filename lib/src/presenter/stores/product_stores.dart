import 'package:bemol_test/src/domain/entities/product.dart';
import 'package:flutter/widgets.dart';

class ProductStores extends ChangeNotifier {
  final ValueNotifier<List<Product>> _products = ValueNotifier([]);

  List<Product> get products => _products.value;

  set products(List<Product> value) {
    _products
      ..value = value
      ..notifyListeners();
  }

  void addProduct(Product product) {
    products = [...products, product];
    _products.notifyListeners();
  }

  void removeProduct(Product product) {
    products = products.where((prod) => prod != product).toList();
    _products.notifyListeners();
  }

  final ValueNotifier<List<Product>> _favoritesProducts = ValueNotifier([]);

  List<Product> get favoritesProducts => _favoritesProducts.value;

  set favoritesProducts(List<Product> value) {
    _favoritesProducts
      ..value = value
      ..notifyListeners();
  }

  void addProductToFavorites(Product product) {
    favoritesProducts = [...favoritesProducts, product];
    _favoritesProducts.notifyListeners();
  }

  void removeProductFromFavorites(Product product) {
    favoritesProducts = favoritesProducts
        .where((prod) => prod != product) //
        .toList();

    _products.notifyListeners();
  }
}
