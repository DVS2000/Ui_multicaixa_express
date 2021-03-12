
class SaldoModel {
    SaldoModel({
        this.data,
        this.message,
    });

    Data data;
    String message;

    factory SaldoModel.fromJson(Map<String, dynamic> json) => SaldoModel(
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
        this.valor,
        this.idUser,
        this.createdAt,
        this.updatedAt,
        this.dataIdUser,
        this.user,
    });

    int id;
    String valor;
    int idUser;
    DateTime createdAt;
    DateTime updatedAt;
    int dataIdUser;
    User user;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] ?? null, 
        valor: json["valor"],
        idUser: json["idUser"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        dataIdUser: json["id_user"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "valor": valor,
        "idUser": idUser,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id_user": dataIdUser,
        "user": user.toJson(),
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
