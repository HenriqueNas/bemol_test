import 'dart:async';
import 'dart:developer';

import 'package:bemol_test/app/core/dependency_injection.dart';
import 'package:bemol_test/src/data/http/http.dart';
import 'package:bemol_test/src/data/storages/storages.dart';
import 'package:bemol_test/src/presenter/stores/product_stores.dart';
import 'package:flutter/widgets.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  const apiBaseUrl = String.fromEnvironment('API_URL');

  dependencies
    ..register(ProductStores())
    ..register<LocalCacheContract<SPCacheObj>>(SPLocalCache())
    ..register<HttpClientContract>(
      DioHttpClient(apiBaseUrl),
    );

  runApp(await builder());
}
