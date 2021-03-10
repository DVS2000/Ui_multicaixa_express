/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone: 944557610 / 992228230(WhatsApp)
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

import 'package:mobx/mobx.dart';
import 'package:ui_multicaixa/src/interfaces/loca_storage_interface.dart';
import 'package:ui_multicaixa/src/models/ative_account_model.dart';
import 'package:ui_multicaixa/src/models/response_model.dart';
import 'package:ui_multicaixa/src/models/user_model.dart';
import 'package:ui_multicaixa/src/repository/ative_account_repository.dart';
import 'package:ui_multicaixa/src/services/local_storage_service.dart';

part 'activate_account_controller.g.dart';

class ActivateAccountController = _ActivateAccountControllerBase
    with _$ActivateAccountController;

abstract class _ActivateAccountControllerBase with Store {
  final ActivateAccountRepository repository;

  _ActivateAccountControllerBase({this.repository});

  @observable
  bool isLoading = false;

  Future<UserModel> activateAccount({ActivateAccountModel model}) async {
    isLoading = true;

    ILocalStorage storage = LocalStorageService();

    final data = await repository.ativeAccount(model: model).timeout(Duration(seconds: 30), onTimeout: () {
      return UserModel(
        objetoUser: null, 
        message: "30s esgostado, tente novamente"
      );
    });

    if (data != null) {
      isLoading = false;

      if (data?.token != null) {
        await storage.put(key: "token", value: data.token);
      }
      return data;
    } else {
      isLoading = false;
      return UserModel(objetoUser: null, message: "Ocorreu um erro inerno");
    }
  }

  Future<ResponseModel> forgotPassword({String phone}) async {
    isLoading = true;

    final data = await repository.forgotPassword(phone: phone);

    if (data != null) {
      isLoading = false;

      return data;
    } else {
      isLoading = false;

      return data;
    }
  }

  Future<ResponseModel> resetPassword(
      {String phone, String code, String password}) async {
    isLoading = true;

    final data = await repository.resetPassword(
        phone: phone, code: code, password: password);

    if (data != null) {
      isLoading = false;

      return data;
    } else {
      isLoading = false;

      return data;
    }
  }
}
