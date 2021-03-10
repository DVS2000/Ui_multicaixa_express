/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone/WhatsApp: 944557610
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

import 'dart:convert';
import 'package:ui_multicaixa/src/interfaces/http_client_interface.dart';
import 'package:ui_multicaixa/src/models/create_account_model.dart';
import 'package:ui_multicaixa/src/services/http_header_service.dart';

class CreateAccoutRepository {
  final IHttpClient client;

  CreateAccoutRepository({this.client});

  /// Função para criar conta de uma nova usuário
  Future<CreateAccountModel> createAccount({DataUser model}) async {
    final response = await client.post(
      route: "user",
      headers: HttpHeaderService.headersWithoutToken(),
      body: model.toJson()
    );

    return CreateAccountModel(
      dataUser: json.decode(response.body)["data"] == null ? null : DataUser.fromJson(json.decode(response.body)["data"]),
      message: json.decode(response.body)["message"]
    );
  }
}
