import 'dart:convert';
import 'package:ui_multicaixa/src/interfaces/http_client_interface.dart';
import 'package:ui_multicaixa/src/models/ative_account_model.dart';
import 'package:ui_multicaixa/src/models/response_model.dart';
import 'package:ui_multicaixa/src/models/user_model.dart';
import 'package:ui_multicaixa/src/services/http_header_service.dart';

class ActivateAccountRepository {
  final IHttpClient client;

  ActivateAccountRepository({this.client});

  /// Função para ativar ou confirmar a conta do `usuário` pelo `Código de Ativação`
  Future<UserModel> ativeAccount({ActivateAccountModel model}) async {
    final response = await client.post(
        route: "ativeAccount",
        headers: HttpHeaderService.headersWithoutToken(),
        body: model.toJson());

    return UserModel(
        objetoUser: json.decode(response.body)["data"] == null
            ? null
            : ObjetoUser.fromJson(json.decode(response.body)["data"]),
        message: json.decode(response.body)["message"],
        token: json.decode(response.body)["token"] ?? null);
  }

  /// Função para fazer o reset da `Palavra-Passe`
  Future<ResponseModel> forgotPassword({String phone}) async {
    Map<String, dynamic> toJsonPhone() => {"phone": phone};

    final response = await client.post(
        route: "forgetPassword",
        headers: HttpHeaderService.headersWithoutToken(),
        body: toJsonPhone());

    return ResponseModel(
        statusCode: response.statusCode,
        message: json.decode(response.body)["message"]);
  }

  /// Função para fazer o reset da `Palavra-Passe`
  Future<ResponseModel> resetPassword(
      {String phone, String code, String password}) async {
    Map<String, dynamic> toJsonPhone() =>
        {"phone": phone, "code": code, "password": password};

    final response = await client.post(
        route: "resetPassword",
        headers: HttpHeaderService.headersWithoutToken(),
        body: toJsonPhone());

    return ResponseModel(
        statusCode: response.statusCode,
        message: json.decode(response.body)["message"]);
  }
}
