/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone: 944557610 / 992228230(WhatsApp)
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

class LoginModel {
  String phone;
  String password;

  LoginModel({this.phone, this.password});

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "password": password
  };
}