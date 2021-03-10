import 'package:http/http.dart';

abstract class IHttpClient {
  
  Future<Response> get({String route, Map<String, dynamic> headers});

  Future<Response> post({String route, Map<String, dynamic> headers, dynamic body});

  Future<Response> put({String route, Map<String, dynamic> headers, dynamic body});

  Future<Response> delete({String route, Map<String, dynamic> headers, dynamic body});
}