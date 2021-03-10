class UsersModel {
    UsersModel({
        this.data,
        this.message,
    });

    List<Datum> data;
    String message;

    factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    Datum({
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
        this.tipo,
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
    Tipo tipo;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        tipo: Tipo.fromJson(json["tipo"]),
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
        "tipo": tipo.toJson(),
    };
}

class Tipo {
    Tipo({
        this.id,
        this.descricao,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String descricao;
    DateTime createdAt;
    DateTime updatedAt;

    factory Tipo.fromJson(Map<String, dynamic> json) => Tipo(
        id: json["id"],
        descricao: json["descricao"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "descricao": descricao,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
