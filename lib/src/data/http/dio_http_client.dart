import 'dart:async';
import 'dart:io';

import 'package:bemol_test/src/data/http/http_client_contract.dart';
import 'package:dio/dio.dart';

class DioHttpClient implements HttpClientContract<DioHttpResponse<dynamic>> {
  DioHttpClient(this.baseUrl);

  final String baseUrl;

  late final _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        HttpHeaders.acceptHeader: '*/*',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    ),
  );

  @override
  FutureOr<DioHttpResponse<T>> get<T>(String url) async {
    try {
      final result = await _dio.get<T>(url);

      return DioHttpResponse<T>(
        data: result.data,
        statusCode: result.statusCode ?? HttpStatus.ok,
      );
    } on DioException catch (error) {
      throw DioHttpException(
        message: error.message,
        statusCode: error.response?.statusCode,
      );
    } catch (_) {
      throw const DioHttpException();
    }
  }

  @override
  FutureOr<DioHttpResponse<T>> post<T>(
    String url, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final result = await _dio.post<T>(
        url,
        data: data,
      );

      return DioHttpResponse<T>(
        data: result.data,
        statusCode: result.statusCode ?? HttpStatus.ok,
      );
    } on DioException catch (error) {
      throw DioHttpException(
        message: error.message,
        statusCode: error.response?.statusCode,
      );
    } catch (_) {
      throw const DioHttpException();
    }
  }
}

class DioHttpResponse<T> implements HttpResponseContract {
  const DioHttpResponse({
    required this.data,
    required this.statusCode,
  });

  @override
  final T? data;

  @override
  final int statusCode;
}

class DioHttpException implements HttpExceptionContract {
  const DioHttpException({
    String? message,
    int? statusCode,
  })  : message = message ?? 'Unknown error occurred in Dio HTTP Client.',
        statusCode = statusCode ?? HttpStatus.internalServerError;

  @override
  final String message;

  @override
  final int statusCode;
}
