/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone: 944557610 / 992228230(WhatsApp)
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

import 'dart:io';
import 'package:ui_multicaixa/src/interfaces/loca_storage_interface.dart';
import 'package:ui_multicaixa/src/services/local_storage_service.dart';

class HttpHeaderService {
  HttpHeaderService._();

  /// Header para Autênticação de URLs sem `JWT(Json Web Token`
  static Map<String, String> headersWithoutToken() =>
      {"Content-Type": "application/json"};

  /// Header para Autênticação de URLs com `JWT(Json Web Token`
  static Future<Map<String, String>> headersWithToken() async {
    final ILocalStorage storage = LocalStorageService();

    final token = await storage.get(key: "token");

    return {
      "content-type": "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
  }
}
