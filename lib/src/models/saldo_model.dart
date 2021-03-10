class SaldoModel {
  ObjectoSaldo saldo;
  String message;

  SaldoModel({this.saldo, this.message});

  factory SaldoModel.fromJson(Map<String, dynamic> json) => SaldoModel(
    saldo: json["data"] == null ? null : ObjectoSaldo.fromJson(json["data"]),
    message: json["message"] ?? ""
  );
}


class ObjectoSaldo {
  int id;
  double valor;
  int idUser;
  DateTime createdAt;
  DateTime updatedAt;

  ObjectoSaldo({
    this.id,
    this.valor,
    this.idUser,
    this.createdAt,
    this.updatedAt
  });

  factory ObjectoSaldo.fromJson(Map<String, dynamic> json) => ObjectoSaldo(
    id: json["id"] ?? 0,
    valor: json["valor"] ?? 0.0,
    idUser: json["idUser"] ?? 0,
    createdAt: json["createdAt"] ?? DateTime.now(),
    updatedAt: json["updatedAt"] ?? DateTime.now()
  );
}