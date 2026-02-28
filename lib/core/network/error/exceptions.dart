import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String? message;
  final Response? response;

  const ServerException({this.message, this.response});
}
