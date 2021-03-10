/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone: 944557610 / 992228230(WhatsApp)
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */


class UserModel {
  ObjetoUser objetoUser;
  String token;
  String message;

  UserModel({this.objetoUser, this.token, this.message});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    objetoUser: json["data"] == null ? null : ObjetoUser.fromJson(json["data"]),
    token: json["token"] ?? null,
    message: json["message"] ?? null
  );
}

class ObjetoUser {
  int id;
  String firstName;
  String secondName;
  String phone;
  String email;
  String urlPhoto;
  String password;
  int tipoId;
  String code;
  DateTime updatedAt;
  DateTime createdAt;
  String passwordHash;
  bool status;
  bool isComplete;
  Tipo tipo;

  ObjetoUser({
    this.id,
    this.firstName,
    this.secondName,
    this.phone,
    this.email,
    this.urlPhoto,
    this.password,
    this.tipoId,
    this.code,
    this.updatedAt,
    this.createdAt,
    this.passwordHash,
    this.status,
    this.isComplete,
    this.tipo,
  });

  factory ObjetoUser.fromJson(Map<String, dynamic> json) => ObjetoUser(
    id: json["id"] ?? null,
    firstName: json["firstName"] ?? null,
    secondName: json["secondName"] ?? null,
    phone: json["phone"] ?? null,
    email: json["email"] ?? null,
    urlPhoto: json["urlPhoto"] ?? null,
    password: json["password"] ?? null,
    passwordHash: json["passwordHash"] ?? null,
    tipoId: json["tipoId"] ?? null,
    code: json["code"] ?? null,
    updatedAt: DateTime.tryParse(json["updatedAt"]) ?? null,
    createdAt: DateTime.tryParse(json["createdAt"]) ?? null,
    status: json["status"] ?? null,
    isComplete: json["isComplete"] ?? null ,
    tipo: Tipo.fromJson(json["tipo"]) ?? null,
  );


  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "secondName": secondName,
    "phone": phone,
    "email": email,
    "urlPhoto": urlPhoto
  };

}

class Tipo {
  int id;
  String descricao;
  DateTime updatedAt;
  DateTime createdAt;

  Tipo({this.id, this.descricao, this.updatedAt, this.createdAt});

  factory Tipo.fromJson(Map<String, dynamic> json) => Tipo(
    id: json["id"] ?? null,
    descricao: json["descricao"] ?? null,
    updatedAt: DateTime.tryParse(json["updatedAt"]) ?? null,
    createdAt: DateTime.tryParse(json["createdAt"]) ?? null
  );
}