class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException({required this.message, this.statusCode, this.data});

  @override
  String toString() {
    return 'ApiException(message: $message, statusCode: $statusCode, data: $data)';
  }
}

class NetworkException extends ApiException {
  NetworkException({required super.message});
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({required super.message, super.data});
}

class NotFoundException extends ApiException {
  NotFoundException({required super.message, super.data});
}

class ServerException extends ApiException {
  ServerException({required super.message, super.statusCode, super.data});
}

class BadRequestException extends ApiException {
  BadRequestException({required super.message, super.data});
}

class RequestCancelledException extends ApiException {
  RequestCancelledException({required super.message, super.data});
}
