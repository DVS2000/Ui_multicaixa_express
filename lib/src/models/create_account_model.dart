/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone: 944557610 / 992228230(WhatsApp)
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

class CreateAccountModel {
  String message;
  DataUser dataUser;

  CreateAccountModel({this.message, this.dataUser});

  factory CreateAccountModel.fromJson(Map<String, dynamic> json) => CreateAccountModel(
    dataUser: json["data"] == null ? null : DataUser.fromJson(json["data"]), 
    message: json["message"] ?? null
  );

  Map<String, dynamic> toJson() => {"data": dataUser, "message": message};
}

class DataUser {
  int id;
  String firstName;
  String secondName;
  String phone;
  String email;
  String password;
  int tipoId;
  String code;
  DateTime updatedAt;
  DateTime createdAt;
  String passwordHash;
  bool status;
  bool isComplete;

  DataUser({
    this.id,
    this.firstName,
    this.secondName,
    this.phone,
    this.email,
    this.password,
    this.passwordHash,
    this.tipoId,
    this.code,
    this.updatedAt,
    this.createdAt,
    this.status,
    this.isComplete
  });

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
    id: json["id"] ?? null,
    firstName: json["firstName"] ?? null,
    secondName: json["secondName"] ?? null,
    phone: json["phone"] ?? null,
    email: json["email"] ?? null,
    password: json["password"] ?? null,
    passwordHash: json["passwordHash"] ?? null,
    tipoId: json["tipoId"] ?? null,
    code: json["code"] ?? null,
    updatedAt: DateTime.tryParse(json["updatedAt"]) ?? null,
    createdAt: DateTime.tryParse(json["createdAt"]) ?? null,
    status: json["status"] ?? null,
    isComplete: json["isComplete"] ?? null
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "secondName": secondName,
    "phone": phone,
    "email": email,
    "password": password,
    "tipoId": tipoId,
    "code": code,
    "updatedAt": updatedAt,
    "createdAt": createdAt,
    "status": status,
    "isComplete": isComplete
  };
}
