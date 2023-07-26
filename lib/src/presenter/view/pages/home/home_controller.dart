import 'package:bemol_test/app/core/dependency_injection.dart';
import 'package:bemol_test/src/domain/entities/product.dart';
import 'package:bemol_test/src/domain/use_cases/get_all_products.dart';
import 'package:bemol_test/src/presenter/stores/product_stores.dart';
import 'package:flutter/material.dart';

class HomeController {
  final _store = dependencies.get<ProductStores>();
  final _pageState = ValueNotifier(HomeState.idle);
  final _searchedList = ValueNotifier<List<Product>>([]);

  void init(VoidCallback callback) {
    _store.addListener(callback);
    _pageState.addListener(callback);
    _searchedList.addListener(callback);

    fetchProducts();
  }

  HomeState get pageState => _pageState.value;
  set pageState(HomeState value) => _pageState.value = value;

  List<Product> get products {
    return _searchedList.value.isNotEmpty
        ? _searchedList.value
        : _store.products;
  }

  void onChangedSearch(String value) {
    if (pageState.isError || pageState.isLoading) return;

    if (value.isEmpty) {
      _searchedList.value = [];
      return;
    }

    final filteredProducts = products.where((product) {
      final title = product.title!.toLowerCase();
      final search = value.toLowerCase();

      return title.contains(search);
    }).toList();

    _searchedList.value = filteredProducts;
  }

  Future<void> fetchProducts() async {
    pageState = HomeState.loading;

    final getAllProducts = GetAllProducts();
    final result = await getAllProducts(null);

    result.fold(
      (_) => pageState = HomeState.error,
      (products) {
        _store.products = products;
        pageState = HomeState.idle;
      },
    );
  }
}

enum HomeState {
  idle,
  loading,
  error;

  bool get isIdle => this == HomeState.idle;

  bool get isLoading => this == HomeState.loading;

  bool get isError => this == HomeState.error;
}
