import '../../index.dart';

class Resultado<T> {
  T? data;
  StatusEnum? status;
  String? statusCodeResponse;
  ErrorResult? error;
  Map<String, String>? errors;

  Resultado.success(this.data, this.statusCodeResponse) {
    status = StatusEnum.success;
    errors = null;
    error = null;
  }

  Resultado.error({
    String? message,
    int? code = 0,
    ErrorResult? error,
    Map<String, String>? errors,
  }) {
    status = StatusEnum.error;
    _setErrores(message, code, error, errors);
  }

  Resultado.unauthorized({
    String? message,
    int code = 0,
    ErrorResult? error,
    Map<String, String>? errors,
  }) {
    status = StatusEnum.unauthorized;
    _setErrores(message, code, error, errors);
  }

  void _setErrores(
    String? message,
    int? code,
    ErrorResult? error,
    Map<String, String>? errors,
  ) {
    this.error = error ??
        ErrorResult(
          message: message,
          code: code,
        );

    this.errors = errors ?? {};
  }
}
