
class TransferenciaModel {
    TransferenciaModel({
        this.data,
        this.message,
    });

    List<ObjetoTransferencia> data;
    String message;

    factory TransferenciaModel.fromJson(Map<String, dynamic> json) => TransferenciaModel(
        data: List<ObjetoTransferencia>.from(json["data"].map((x) => ObjetoTransferencia.fromJson(x))),
        message: json["message"],
    );
}

class ObjetoTransferencia {
    ObjetoTransferencia({
        this.id,
        this.idUserFrom,
        this.idUserTo,
        this.valor,
        this.createdAt,
        this.updatedAt,
        this.datumIdUserFrom,
        this.datumIdUserTo,
        this.from,
        this.to,
    });

    int id;
    int idUserFrom;
    int idUserTo;
    String valor;
    DateTime createdAt;
    DateTime updatedAt;
    int datumIdUserFrom;
    int datumIdUserTo;
    User from;
    User to;

    factory ObjetoTransferencia.fromJson(Map<String, dynamic> json) => ObjetoTransferencia(
        id: json["id"],
        idUserFrom: json["idUserFrom"],
        idUserTo: json["idUserTo"],
        valor: json["valor"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        from: User.fromJson(json["from"]),
        to: User.fromJson(json["to"]),
    );

    Map<String, dynamic> toJson() => {
        "idUserFrom": idUserFrom,
        "idUserTo": idUserTo,
        "valor": valor,
    };
}

class User {
    User({
        this.id,
        this.firstName,
        this.secondName,
        this.phone,
        this.email,
        this.urlPhoto,
        this.code,
        this.status,
        this.isComplete,
        this.password,
        this.tipoId,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String firstName;
    String secondName;
    String phone;
    String email;
    dynamic urlPhoto;
    String code;
    bool status;
    bool isComplete;
    String password;
    int tipoId;
    DateTime createdAt;
    DateTime updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        secondName: json["secondName"],
        phone: json["phone"],
        email: json["email"],
        urlPhoto: json["urlPhoto"],
        code: json["code"],
        status: json["status"],
        isComplete: json["isComplete"],
        password: json["password"],
        tipoId: json["tipoId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "secondName": secondName,
        "phone": phone,
        "email": email,
        "urlPhoto": urlPhoto,
        "code": code,
        "status": status,
        "isComplete": isComplete,
        "password": password,
        "tipoId": tipoId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

