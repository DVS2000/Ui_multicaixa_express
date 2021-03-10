class ActivateAccountModel {
  String phone;
  String code;

  ActivateAccountModel({this.phone, this.code});

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "code": code
  };
}