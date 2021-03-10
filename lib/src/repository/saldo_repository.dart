import 'dart:convert';
import 'package:ui_multicaixa/src/interfaces/http_client_interface.dart';
import 'package:ui_multicaixa/src/models/saldo_model.dart';
import 'package:ui_multicaixa/src/services/http_header_service.dart';

class SaldoRepository {
  final IHttpClient client;

  SaldoRepository({this.client});

  Future<SaldoModel> get() async {
    final response = await client.get(
      route: "saldo",
      headers: await HttpHeaderService.headersWithToken()
    );

    return SaldoModel.fromJson(json.decode(response.body));
  }
}