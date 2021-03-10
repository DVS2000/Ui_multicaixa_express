import 'dart:convert';
import 'package:ui_multicaixa/src/interfaces/http_client_interface.dart';
import 'package:ui_multicaixa/src/models/transferencia_model.dart';
import 'package:ui_multicaixa/src/models/transferencia_reponse.dart';
import 'package:ui_multicaixa/src/services/http_header_service.dart';

class TransferenciaRepository {
  final IHttpClient client;

  TransferenciaRepository({this.client});

  Future<TransferenciaModel> get() async {
    final response = await client.get(
      route: "transferencias/token",
      headers: await HttpHeaderService.headersWithToken()
    );

    return TransferenciaModel.fromJson(json.decode(response.body));
  }

  Future<TransferenciaResponse> store({ObjetoTransferencia model}) async {
    final response = await client.post(
      route: "transferencias",
      headers: await HttpHeaderService.headersWithToken(),
      body: model.toJson()
    );

    return TransferenciaResponse.fromJson(json.decode(response.body));
  }
}