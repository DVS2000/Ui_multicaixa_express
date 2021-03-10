class TransferenciaResponse {
    TransferenciaResponse({
        this.data,
        this.message,
    });

    Data data;
    String message;

    factory TransferenciaResponse.fromJson(Map<String, dynamic> json) => TransferenciaResponse(
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
    };
}

class Data {
    Data({
        this.id,
        this.idUserFrom,
        this.idUserTo,
        this.valor,
        this.updatedAt,
        this.createdAt,
    });

    int id;
    int idUserFrom;
    int idUserTo;
    String valor;
    DateTime updatedAt;
    DateTime createdAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        idUserFrom: json["idUserFrom"],
        idUserTo: json["idUserTo"],
        valor: json["valor"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idUserFrom": idUserFrom,
        "idUserTo": idUserTo,
        "valor": valor,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
    };
}
