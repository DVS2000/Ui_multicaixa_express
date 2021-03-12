/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone/WhatsApp: 944557610
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

import 'dart:convert';
import 'package:ui_multicaixa/src/interfaces/http_client_interface.dart';
import 'package:ui_multicaixa/src/models/user_model.dart';
import 'package:ui_multicaixa/src/models/users_model.dart';
import 'package:ui_multicaixa/src/services/http_header_service.dart';

class UserRepository {
  final IHttpClient client;

  UserRepository({this.client});

  // Funão pagar pegar todos users
  Future<UsersModel> getAllUser() async {
    final response = await client.get(
      route: "users",
      headers: await HttpHeaderService.headersWithToken()
    );

    if(response.statusCode == 200) {
      return UsersModel.fromJson(json.decode(response.body));
    } else {
      return UsersModel(
        data: null,
        message: json.decode(response.body)["message"]
      );
    }
  }

  /// Função para pegar todos dados do `usuário`
  Future<UserModel> getData() async {
    final response = await client.get(
      route: "user", 
      headers: await HttpHeaderService.headersWithToken()
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      return UserModel(
        objetoUser: null, 
        message: json.decode(response.body)["message"]
      );
    }
  }

  /// Função para editar o perfil do `usuário`
  Future<UserModel> update({ObjetoUser model}) async {
    final response = await client.put(
      route: "user",
      headers: await HttpHeaderService.headersWithToken(),
      body: model.toJson()
    );

    return UserModel(
      objetoUser: json.decode(response.body)["data"] == null
        ? null
        : ObjetoUser.fromJson(json.decode(response.body)["data"]),
      message: json.decode(response.body)["message"]
    );
  }
}
