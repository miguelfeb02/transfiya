import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../../../data/models/base/resultado.dart';
import '../../config/transfiya_constants.dart';
import '../../../data/utils/conectivity.dart';
import '../../../data/utils/singleton_share_preferences.dart';
import 'api_base_strings.dart';
import 'enums/http_methods_enum.dart';
import 'enums/type_response_enum.dart';

class ApiSource {
  final String? baseUrl;
  final http.Client client;
  final MyConnectivity connectivity;
  final MySingletonSharedPreferences singletonSharedPreferences;

  ApiSource(
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
  }) async {
    try {
      var isConnected = await connectivity.isConnected();
      if (!isConnected) {
        return Resultado<T>.error(message: ApiBaseStrings.internetNotAvailable);
      }
      headers = getHeaders(headers);
      var response = await client
          .get(Uri.parse(url), headers: headers)
          .timeout(TransfiyaConstants.duracionConsumoApi);
      return await _manageResponse<T>(response, url, mapperFunction,
          HttpMethodsEnum.GET, null, typeResponse);
    } catch (ex) {
      log(ex.toString(), name: 'responseError1', error: ex);
      return Resultado<T>.error(message: ApiBaseStrings.defaultError);
    }
  }

  Future<Resultado<T>> postApi<T>(
    String url,
    Map<String, dynamic>? body,
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
      log(json.encode(body), name: 'requestBody');

      http.Response response = await client
          .post(Uri.parse(url),
              body: body != null ? json.encode(body) : null, headers: headers)
          .timeout(TransfiyaConstants.duracionConsumoApi);
      return await _manageResponse<T>(response, url, mapperFunction,
          HttpMethodsEnum.POST, body, typeResponse);
    } catch (ex) {
      log(ex.toString(), name: 'responseError2', error: ex);
      return Resultado<T>.error(message: ApiBaseStrings.defaultError);
    }
  }

  Future<Resultado<T>> putApi<T>(
    String url,
    Map<String, dynamic>? body,
    T Function(dynamic value) mapperFunction, {
    Map<String, String>? headers,
    TypeResponseEnum typeResponse = TypeResponseEnum.DATA_IN_BODY,
  }) async {
    try {
      var isConnected = await connectivity.isConnected();
      if (!isConnected) {
        return Resultado<T>.error(message: ApiBaseStrings.internetNotAvailable);
      }
      headers = getHeaders(headers);
      log(json.encode(body), name: 'requestBody');
      var response = await client
          .put(Uri.parse(url), body: json.encode(body), headers: headers)
          .timeout(TransfiyaConstants.duracionConsumoApi);
      return await _manageResponse<T>(response, url, mapperFunction,
          HttpMethodsEnum.PUT, body, typeResponse);
    } catch (ex) {
      log(ex.toString(), name: 'responseError3', error: ex);
      return Resultado<T>.error(message: ApiBaseStrings.defaultError);
    }
  }

  Future<Resultado<T>> deleteApi<T>(
    String url,
    T Function(dynamic value) mapperFunction, {
    Map<String, String>? headers,
    TypeResponseEnum typeResponse = TypeResponseEnum.DATA_IN_BODY,
  }) async {
    try {
      var isConnected = await connectivity.isConnected();
      if (!isConnected) {
        return Resultado<T>.error(message: ApiBaseStrings.internetNotAvailable);
      }
      headers = getHeaders(headers);
      var response = await client
          .delete(Uri.parse(url), headers: headers)
          .timeout(TransfiyaConstants.duracionConsumoApi);
      return await _manageResponse<T>(response, url, mapperFunction,
          HttpMethodsEnum.DELETE, null, typeResponse);
    } catch (ex) {
      log(ex.toString(), name: 'responseError4', error: ex);
      return Resultado<T>.error(message: ApiBaseStrings.defaultError);
    }
  }

  Future<Resultado<T>> _manageResponse<T>(
    http.Response response,
    String url,
    T Function(dynamic value) mapperFunction,
    HttpMethodsEnum method,
    Map<String, dynamic>? body,
    TypeResponseEnum typeResponse,
  ) async {
    try {
      _logResponse(response);
      if (response.statusCode == 200) {
        Map? responseMap = _decodeJson(response.body);

        return _decodeBodyWithTypeResponse<T>(
          typeResponse,
          responseMap,
          mapperFunction,
        );
      }

      return _manageError<T>(response);
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
  ) {
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
      mapperFunctionApply = mapperFunction(body);
    }

    return Resultado<T>.success(
      mapperFunctionApply,
      statusCodeResponse,
    );
  }

  Resultado<T> _manageError<T>(http.Response response) {
    if (response.statusCode >= 500) {
      return Resultado<T>.error(message: ApiBaseStrings.defaultError);
    } else {
      return _errorFromMap(response);
    }
  }

  Resultado<T> _errorFromMap<T>(http.Response response) {
    try {
      Map<String, dynamic>? body =
          (response.body.isNotEmpty) ? jsonDecode(response.body) : null;
      if (body != null) {
        String? description = body['description'];
        description = description ?? ApiBaseStrings.defaultError;
        int? code =
            body.containsKey('statusCodeValue') ? body['statusCodeValue'] : 0;
        return Resultado<T>.error(message: description, code: code);
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
    headers = setHeaderToken(headers);
    headers['X-Body'] = xBody ?? '';
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
    singletonSharedPreferences.token = token;
  }

  String? getToken() {
    return singletonSharedPreferences.token;
  }
}
