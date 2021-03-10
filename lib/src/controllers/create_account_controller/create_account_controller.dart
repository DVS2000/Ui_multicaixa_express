/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone: 944557610 / 992228230(WhatsApp)
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

import 'package:mobx/mobx.dart';
import 'package:ui_multicaixa/src/models/create_account_model.dart';
import 'package:ui_multicaixa/src/repository/create_accout_repository.dart';
part 'create_account_controller.g.dart';

class CreateAccountController = _CreateAccountControllerBase with _$CreateAccountController;

abstract class _CreateAccountControllerBase with Store {
  final CreateAccoutRepository repository;

  _CreateAccountControllerBase({this.repository});

  @observable
  bool isLoading = false;

  Future<CreateAccountModel> createAccount({DataUser model}) async {
    isLoading = true;

    final data = await repository.createAccount(model: model).timeout(Duration(seconds: 30), onTimeout: () {
      return CreateAccountModel(
        dataUser: null, 
        message: "30s esgostado, tente novamente"
      );
     }
    );

    if (data != null) {
      isLoading = false;
      return data;
    } else {
      isLoading = false;
      return CreateAccountModel(
        dataUser: null, 
        message: "Ocorreu um erro interno."
      );
    }
  }
}
