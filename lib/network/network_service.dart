import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:music_rental_flutter/main.dart';
import 'package:music_rental_flutter/network/network_helper.dart';
import 'dart:convert';

enum RequestType { get, post, patch, delete }

class NetworkService {
  const NetworkService._();

  static Map<String, String> _getHeaders() =>
      {'Content-type': 'application/json'};

  static Map<String, String> _getHeadersWithToken(String token) =>
      {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

  static Future<http.Response>? _createRequest(
      {required RequestType requestType,
      required Uri uri,
      Map<String, String>? headers,
      Map<String, dynamic>? body}) {
    if (requestType == RequestType.get) {
      return http.get(
        uri,
        headers: headers,
      );
    } else if (requestType == RequestType.post) {
      return http.post(uri, body: json.encode(body), headers: headers);
    } else if (requestType == RequestType.patch) {
      return http.patch(uri, body: json.encode(body), headers: headers);
    } else if (requestType == RequestType.delete) {
      return http.delete(uri, headers: headers, body: json.encode(body));
    }
  }

  static Future<http.Response?>? sendRequest({
    required RequestType requestType,
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? queryParam,
  }) async {
    try {
      final _header = _getHeaders();
      final _url = NetworkHelper.concatUriQP(url, queryParam);

      final response = await _createRequest(
        requestType: requestType,
        uri: Uri.parse(url),
        headers: _header,
        body: body,
      );

      return response;
    } catch (e) {
      // if (kDebugMode) {
      print(e);
      // }
      return null;
    }
  }

  static Future<http.Response?>? sendAuthRequest({
    required RequestType requestType,
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? queryParam,
  }) async {
    try {
      final token = await storage.read(key: 'userToken') ??
          (await storage.read(key: 'token') ?? '');

      final _header = _getHeadersWithToken(token);
      final _url = NetworkHelper.concatUriQP(url, queryParam);

      final response = await _createRequest(
        requestType: requestType,
        uri: Uri.parse(url),
        headers: _header,
        body: body,
      );

      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
