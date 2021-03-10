/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone/WhatsApp: 944557610
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

import 'dart:convert';
import 'package:ui_multicaixa/src/interfaces/http_client_interface.dart';
import 'package:ui_multicaixa/src/models/login_model.dart';
import 'package:ui_multicaixa/src/models/user_model.dart';
import 'package:ui_multicaixa/src/services/http_header_service.dart';

class LoginRepository {
  final IHttpClient client;

  LoginRepository({this.client});

  /// Função para fazer o `login`
  Future<UserModel> login({LoginModel model}) async {
    final response = await client.post(
        route: "auth",
        headers: HttpHeaderService.headersWithoutToken(),
        body: model.toJson());

    return UserModel(
        objetoUser: json.decode(response.body)["data"] == null
            ? null
            : ObjetoUser.fromJson(json.decode(response.body)["data"]),
        message: json.decode(response.body)["message"],
        token: json.decode(response.body)["token"] ?? "");
  }
}
