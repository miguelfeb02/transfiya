import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../data/models/a_base/resultado.dart';
import '../../../data/utils/seguridad/cipher/cipher_object.dart';
import '../../config/transfiya_constants.dart';
import '../../../data/utils/conectivity.dart';
import '../../../data/utils/singleton_share_preferences.dart';
import 'api_base_strings.dart';
import 'enums/http_methods_enum.dart';
import 'enums/type_response_enum.dart';

class ApiSourceResponse {
  final String? uuid;
  final String? baseUrl;
  final http.Client client;
  final MyConnectivity connectivity;
  final MySingletonSharedPreferences singletonSharedPreferences;

  ApiSourceResponse(
    this.uuid,
    this.baseUrl,
    this.client,
    this.connectivity,
    this.singletonSharedPreferences,
  );

  Future<Resultado<T>> getApi<T>(
    String url,
    T Function(dynamic value) mapperFunction, {
    Map<String, String>? headers,
    TypeResponseEnum typeResponse = TypeResponseEnum.DATA_IN_BODY,
    String? xBody,
    String? autorization,
  }) async {
    try {
      var isConnected = await connectivity.isConnected();
      if (!isConnected) {
        return Resultado<T>.error(message: ApiBaseStrings.internetNotAvailable);
      }
      headers = getHeaders(headers, xBody: xBody, authorization: autorization);
      var response = await client
          .get(Uri.parse(url), headers: headers)
          .timeout(TransfiyaConstants.duracionConsumoApi);
      return await _manageResponse<T>(response, url, mapperFunction,
          HttpMethodsEnum.GET, null, typeResponse, autorization ?? '');
    } catch (ex, stacktrace) {
      log(ex.toString(), name: 'responseError5', error: ex);
      log(ex.toString(),
          name: 'responseError5_stacktrace', error: stacktrace.toString());
      return Resultado<T>.error(message: ApiBaseStrings.defaultError);
    }
  }

  Future<Resultado<Respuesta>> postApi<Respuesta>(
    String url,
    String? body,
    Respuesta Function(dynamic value) mapperFunction, {
    Map<String, String>? headers,
    TypeResponseEnum typeResponse = TypeResponseEnum.DATA_IN_BODY,
    String? xBody,
    String? autorization,
  }) async {
    try {
      var isConnected = await connectivity.isConnected();
      if (!isConnected) {
        return Resultado<Respuesta>.error(
            message: ApiBaseStrings.internetNotAvailable);
      }

      headers = getHeaders(headers, xBody: xBody, authorization: autorization);
      log(json.encode(body), name: 'requestBody');

      http.Response response = await client
          .post(Uri.parse(url),
              body: body != null ? json.encode(body) : null, headers: headers)
          .timeout(TransfiyaConstants.duracionConsumoApi);
      return await _manageResponse<Respuesta>(response, url, mapperFunction,
          HttpMethodsEnum.POST, body, typeResponse, autorization ?? '');
    } catch (ex) {
      log(ex.toString(), name: 'responseError6', error: ex);
      return Resultado<Respuesta>.error(message: ApiBaseStrings.defaultError);
    }
  }

  Future<Resultado<Respuesta>> putApi<Respuesta>(
    String url,
    String? body,
    Respuesta Function(dynamic value) mapperFunction, {
    Map<String, String>? headers,
    TypeResponseEnum typeResponse = TypeResponseEnum.DATA_IN_BODY,
    String? xBody,
    String? autorization,
  }) async {
    try {
      var isConnected = await connectivity.isConnected();
      if (!isConnected) {
        return Resultado<Respuesta>.error(
            message: ApiBaseStrings.internetNotAvailable);
      }

      headers = getHeaders(headers, xBody: xBody, authorization: autorization);
      log(json.encode(body), name: 'requestBody');

      http.Response response = await client
          .put(Uri.parse(url),
              body: body != null ? json.encode(body) : null, headers: headers)
          .timeout(TransfiyaConstants.duracionConsumoApi);
      return await _manageResponse<Respuesta>(response, url, mapperFunction,
          HttpMethodsEnum.POST, body, typeResponse, autorization ?? '');
    } catch (ex) {
      log(ex.toString(), name: 'responseError6', error: ex);
      return Resultado<Respuesta>.error(message: ApiBaseStrings.defaultError);
    }
  }

  Future<Resultado<Respuesta>> _manageResponse<Respuesta>(
    http.Response response,
    String url,
    Respuesta Function(dynamic value) mapperFunction,
    HttpMethodsEnum method,
    String? body,
    TypeResponseEnum typeResponse,
    String autorization,
  ) async {
    try {
      _logResponse(response);
      if (TransfiyaConstants.codigosHttp.contains(response.statusCode)) {
        Map? responseMap = _decodeJson(response.body);
        return _decodeBodyWithTypeResponse<Respuesta>(
          typeResponse,
          responseMap,
          mapperFunction,
          autorization,
        );
      }

      return _manageError<Respuesta>(response, autorization);
    } on Exception catch (ex) {
      log('No fue posible procesar la respuesta - ${ex.toString()}',
          name: '_manageResponse');
      return Resultado.error(message: ApiBaseStrings.defaultError);
    }
  }

  void _logResponse(
    http.Response response,
  ) {
    log(response.request!.url.toString(), name: 'url');
    log(response.request!.method, name: 'method');
    log(response.request!.headers.toString(), name: 'headers');
    log(response.statusCode.toString(), name: 'statusCode');
    log(response.body, name: 'responseBody');
  }

  Resultado<T> _decodeBodyWithTypeResponse<T>(
      TypeResponseEnum typeResponse,
      Map? responseMap,
      T Function(dynamic value) mapperFunction,
      String autorization) {
    dynamic body;
    String? statusCodeResponse;

    switch (typeResponse) {
      case TypeResponseEnum.DATA_IN_BODY:
        body = _getPropertyFromMap(responseMap!, 'body');
        statusCodeResponse = responseMap.containsKey('statusCode')
            ? responseMap['statusCode']
            : 'OK';
        break;

      case TypeResponseEnum.DATA_IN_RESPONSE:
        body = _getPropertyFromMap(responseMap!, 'response');
        statusCodeResponse =
            responseMap.containsKey('codigo') ? responseMap['codigo'] : 'OK';
        break;

      case TypeResponseEnum.DATA:
        body = responseMap;
        statusCodeResponse = 'OK';
        break;
    }

    T? mapperFunctionApply;
    if (body != null) {
      if (body['respuesta'] == null) {
        return Resultado<T>.error(
            message: body.containsKey('mensaje')
                ? CipherObject.decryptObject(autorization, body['mensaje'])
                : ApiBaseStrings.defaultError);
      }
      mapperFunctionApply = mapperFunction(body);
    }

    return Resultado<T>.success(
      mapperFunctionApply,
      statusCodeResponse,
    );
  }

  Resultado<T> _manageError<T>(http.Response response, String autorization) {
    if (response.statusCode >= 500) {
      return Resultado<T>.error(message: ApiBaseStrings.defaultError);
    } else {
      return _errorFromMap(response, autorization);
    }
  }

  Resultado<T> _errorFromMap<T>(http.Response response, String autorization) {
    try {
      Map<String, dynamic>? body =
          (response.body.isNotEmpty) ? jsonDecode(response.body) : null;

      if (body != null) {
        String? description = body['description'];
        String? mensaje = body['mensaje'];
        if (autorization != '') {
          mensaje = CipherObject.decryptObject(autorization, body['mensaje']);
        }

        String respuesta =
            _responseError(description: description, mensajeApi: mensaje);
        int? code = 0;

        if (body.containsKey('statusCodeValue')) {
          code = body['statusCodeValue'];
        } else if (response.statusCode != 0) {
          code = response.statusCode;
        }

        return Resultado<T>.error(message: respuesta, code: code);
      } else {
        return Resultado<T>.error(
            message: ApiBaseStrings.defaultError, code: response.statusCode);
      }
    } catch (ex) {
      log(ex.toString(), name: 'error');
      return Resultado<T>.error(
          message: ApiBaseStrings.defaultError, code: response.statusCode);
    }
  }

  String _responseError({String? mensajeApi, String? description}) {
    String respuesta = '';
    if (mensajeApi != null) {
      respuesta = mensajeApi;
    } else if (description != null) {
      respuesta = description;
    } else {
      respuesta = ApiBaseStrings.defaultError;
    }

    return respuesta;
  }

  dynamic _decodeJson(String body) {
    try {
      return json.decode(body);
    } catch (ex) {
      log(ex.toString(), name: 'decodeJson');
      return body;
    }
  }

  dynamic _getPropertyFromMap(Map jsonResponse, String key) {
    try {
      if (jsonResponse.containsKey(key)) {
        return jsonResponse[key];
      } else {
        return jsonResponse;
      }
    } catch (ex) {
      log(ex.toString(), name: '_getPropertyFromMap');
      return jsonResponse;
    }
  }

  Map<String, String> getHeaders(Map<String, String>? headers,
      {String? xBody, String? authorization}) {
    headers = headers ?? <String, String>{};

    headers[HttpHeaders.contentTypeHeader] = "application/json; charset=utf-8";
    headers[HttpHeaders.acceptCharsetHeader] = "charset=UTF-8";
    headers[HttpHeaders.acceptHeader] = "application/json; charset=UTF-8";
    headers['X-Body'] = xBody ?? '';
    headers['X-Requester'] = 'SVC';
    headers['Authorization'] = authorization ?? '';
    return headers;
  }

  Map<String, String> setHeaderToken(Map<String, String> headers) {
    var token = getToken();
    if (token != null) {
      headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    return headers;
  }

  void saveToken(String? token) {
    singletonSharedPreferences.uuid = token;
  }

  String? getToken() {
    return singletonSharedPreferences.uuid;
  }
}
