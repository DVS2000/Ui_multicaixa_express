/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone: 944557610 / 992228230(WhatsApp)
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

import 'dart:convert';
import 'dart:io';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:ui_multicaixa/src/interfaces/http_client_interface.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';
import 'package:connectivity/connectivity.dart';

class ClientHttpService implements IHttpClient {
  final _ioc = HttpClient();
  Client _client;

  ClientHttpService() {
    _ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    _client = IOClient(_ioc);
  }

  @override
  Future<Response> get({String route, Map<String, dynamic> headers}) async {
    try {
      var connResult = await(Connectivity().checkConnectivity());

      if (!(connResult == ConnectivityResult.none)) {
        return await _client.get(URL_BASE_API + route, headers: headers);
      } else {
        return Response("{\"data\": null, \"message\": \"Sem internet\"}", 511);
      }
    } catch (e) {
      return Response("{\"data\": null, \"message\": \"Ocorreu um erro interno\"}", 500);
    }
  }

  @override
  Future<Response> post({String route, Map<String, dynamic> headers, dynamic body}) async {
    try {
      var connResult = await(Connectivity().checkConnectivity());

      if (!(connResult == ConnectivityResult.none)) {
        return await _client.post(
          URL_BASE_API + route,
          headers: headers, 
          body: jsonEncode(body)
        );

      } else {
        return Response("{\"data\": null, \"message\": \"Sem internet\"}", 511);
      }
    } catch (e) {
      return Response("{\"data\": null, \"message\": \"Ocorreu um erro interno\"}", 500);
    }
  }

  @override
  Future<Response> put({String route, Map<String, dynamic> headers, dynamic body}) async {
    try {
      var connResult = await(Connectivity().checkConnectivity());

      if (!(connResult == ConnectivityResult.none)) {
        return await _client.put(
          URL_BASE_API + route,
          headers: headers, 
          body: jsonEncode(body)
        );

      } else {
        return Response("{\"data\": null, \"message\": \"Sem internet\"}", 511);
      }
    } catch (e) {
      return Response("{\"data\": null, \"message\": \"Ocorreu um erro interno\"}", 500);
    }
  }

  @override
  Future<Response> delete({String route, Map<String, dynamic> headers, body}) async {
    try {
      var connResult = await(Connectivity().checkConnectivity());

      if (!(connResult == ConnectivityResult.none)) {
        return await _client.delete(
          URL_BASE_API + route, 
          headers: headers
        );
        
      } else {
        return Response("{\"data\": null, \"message\": \"Sem internet\"}", 511);
      }
    } catch (e) {
      return Response("{\"data\": null, \"message\": \"Ocorreu um erro interno\"}", 500);
    }
  }
}
