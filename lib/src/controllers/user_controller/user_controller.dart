import 'package:mobx/mobx.dart';
import 'package:ui_multicaixa/src/models/user_model.dart';
import 'package:ui_multicaixa/src/models/users_model.dart';
import 'package:ui_multicaixa/src/repository/user_repository.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';
part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  final UserRepository repository;

  _UserControllerBase({this.repository});

  @observable
  bool isLoading = false;

  @observable
  UserModel user = UserModel();

  @observable
  UsersModel users = UsersModel();


  Future<void> getAllUsers() async {
    if(users.data == null) {
      isLoading = true;
    }

    final data = await repository.getAllUser();

    if(data != null) {
      isLoading = false;
      users = data;
    } else {
      users = UsersModel(
        data: null,
        message: "Ocorreu um erro interno tente mais tarde."
      );
    }
  }

  Future<void> getData() async {
    if (user.objetoUser == null) {
      isLoading = true;
    }

    final data = await repository.getData();

    if (data != null) {
      isLoading = false;

      if (data != user) {
        user = data;
      }

      idUserFrom = data?.objetoUser?.id?.toString();
    } else {
      isLoading = false;

      user = UserModel(objetoUser: null, message: "Ocorreu um erro interno");
    }
  }

  Future<void> update({ObjetoUser model}) async {
    isLoading = true;

    final data = await repository.update(model: model);

    if (data != null) {
      isLoading = false;

      user = data;
    } else {
      user = UserModel(objetoUser: null, message: "Ocorreu um erro interno");
    }
  }
}
