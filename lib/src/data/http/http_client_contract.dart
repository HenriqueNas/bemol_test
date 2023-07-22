import 'dart:async';

/// Defines the contract for the HTTP client implementation.
abstract interface class HttpClientContract<R extends HttpResponseContract> {
  /// Define the GET method for the HTTP client </br>
  /// Has [url] as a required parameter.
  FutureOr<R> get<T>(String url);

  /// Define the POST method for the HTTP client.
  /// Has [url] as a required parameter and [data] as an optional parameter.
  FutureOr<R> post<T>(
    String url, {
    Map<String, dynamic>? data,
  });
}

/// Defines the contract for the HTTP response implementation.
abstract interface class HttpResponseContract {
  /// Returns the status code of the HTTP response.
  int get statusCode;

  /// Returns the data of the HTTP response.
  dynamic get data;
}

/// Defines the contract for the HTTP exception implementation.
abstract interface class HttpExceptionContract implements Exception {
  /// The reason for the HTTP exception.
  String get message;

  /// The status code for the HTTP exception.
  int get statusCode;
}
