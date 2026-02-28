import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sphere_book_app/core/api/api_constants/api_constants.dart';
import 'package:sphere_book_app/core/api/api_consumer/api_consumer.dart';
import 'package:sphere_book_app/core/api/error/failures.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiConstants.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.sendTimeout = const Duration(seconds: 30);

    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        error: true,
        responseBody: true,
        responseHeader: true,
        requestHeader: true,
      ),
    );
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 410) return const Left(AccountReviewFailure());
      return Right(response.data ?? {});
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> post(
    String url, {
    Map<String, dynamic>? data,
    FormData? formData,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: formData ?? data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 410) return const Left(AccountReviewFailure());
      return Right(response.data ?? {});
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> postFormData(
    String url, {
    Map<String, dynamic>? data,
    FormData? formData,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return post(
      url,
      data: data,
      formData: formData,
      queryParameters: queryParameters,
      headers: headers,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> put(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool formData = false,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 410) return const Left(AccountReviewFailure());
      return Right(response.data ?? {});
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> patch(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 410) return const Left(AccountReviewFailure());
      return Right(response.data ?? {});
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> delete(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      if (response.statusCode == 410) return const Left(AccountReviewFailure());
      return Right(response.data ?? {});
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    }
  }

  @override
  Future<Either<Failure, String>> downloadFile({
    required String url,
    required String savePath,
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      await dio.download(
        url,
        savePath,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return const Right('Download completed successfully');
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> uploadFile(
    String url, {
    required Map<String, dynamic> formData,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: FormData.fromMap(formData),
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 410) return const Left(AccountReviewFailure());
      return Right(response.data ?? {});
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    }
  }

  @override
  void addInterceptor(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
  }

  @override
  void removeAllInterceptors() {
    dio.interceptors.clear();
  }

  @override
  void updateHeader(Map<String, dynamic> headers) {
    dio.options.headers.addAll(headers);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> retryApiCall(
    Future<Either<Failure, Map<String, dynamic>>> Function() apiCall, {
    int retryCount = 0,
  }) async {
    for (int i = 0; i <= retryCount; i++) {
      final result = await apiCall();
      if (result.isRight()) {
        return result;
      }
    }
    return const Left(ServerFailure("Max retries exceeded"));
  }

  Failure _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ServerFailure("Connection timed out");
      case DioExceptionType.badResponse:
        return _handleBadResponse(e.response);
      case DioExceptionType.cancel:
        return const ServerFailure("Request cancelled");
      case DioExceptionType.connectionError:
        return const ServerFailure("No internet connection");
      case DioExceptionType.unknown:
        if (e.error is SocketException) {
          return const ServerFailure("No internet connection");
        }
        return const ServerFailure("Unexpected error occurred");
      case DioExceptionType.badCertificate:
        return const ServerFailure("Bad certificate");
    }
  }

  Failure _handleBadResponse(Response? response) {
    if (response == null) {
      return const ServerFailure("Unknown error occurred");
    }
    // Try to parse the error message from the response
    // Common patterns: 'message', 'error', 'errors'
    final data = response.data;
    if (data is Map<String, dynamic>) {
      if (data.containsKey('errors')) {
        final errors = data['errors'];
        if (errors is Map<String, dynamic>) {
          return ServerFailure(errors.values.first.first.toString());
        }
        if (errors is List && errors.isNotEmpty) {
          return ServerFailure(errors.first.toString());
        }
      }
      if (data.containsKey('message')) {
        return ServerFailure(data['message'].toString());
      }
      if (data.containsKey('error')) {
        return ServerFailure(data['error'].toString());
      }
      return ServerFailure(data.toString());
    }

    return ServerFailure("Server error: ${response.statusCode}");
  }
}
