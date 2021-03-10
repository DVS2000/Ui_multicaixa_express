/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone: 944557610 / 992228230(WhatsApp)
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

import 'package:mobx/mobx.dart';
import 'package:ui_multicaixa/src/interfaces/loca_storage_interface.dart';
import 'package:ui_multicaixa/src/models/login_model.dart';
import 'package:ui_multicaixa/src/models/user_model.dart';
import 'package:ui_multicaixa/src/repository/login_repository.dart';
import 'package:ui_multicaixa/src/services/local_storage_service.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginRepository repository;

  _LoginControllerBase({this.repository});

  @observable
  bool isLoading = false;

  Future<UserModel> login({LoginModel model}) async {
    isLoading = true;

    ILocalStorage storage = LocalStorageService();

    final data = await repository
        .login(model: model)
        .timeout(Duration(seconds: 30), onTimeout: () {
      return UserModel(
          objetoUser: null, message: "30s esgostado, tente novamente");
    });

    if (data != null) {
      isLoading = false;

      if (data.token != null) {
        await storage.put(key: "token", value: data.token);
      }

      return data;
    } else {
      isLoading = false;

      return UserModel(objetoUser: null, message: "Ocorreu um erro interno");
    }
  }
}
