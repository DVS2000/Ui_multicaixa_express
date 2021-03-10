/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone: 944557610 / 992228230(WhatsApp)
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

import 'package:get_it/get_it.dart';
import 'package:ui_multicaixa/src/controllers/activate_account_controller/activate_account_controller.dart';
import 'package:ui_multicaixa/src/controllers/create_account_controller/create_account_controller.dart';
import 'package:ui_multicaixa/src/controllers/login_controller/login_controller.dart';
import 'package:ui_multicaixa/src/controllers/saldo_controller/saldo_controller.dart';
import 'package:ui_multicaixa/src/controllers/transferencia_controller/transferencia_controller.dart';
import 'package:ui_multicaixa/src/controllers/user_controller/user_controller.dart';
import 'package:ui_multicaixa/src/repository/ative_account_repository.dart';
import 'package:ui_multicaixa/src/repository/create_accout_repository.dart';
import 'package:ui_multicaixa/src/repository/login_repository.dart';
import 'package:ui_multicaixa/src/repository/saldo_repository.dart';
import 'package:ui_multicaixa/src/repository/transferencia_repository.dart';
import 'package:ui_multicaixa/src/repository/user_repository.dart';
import 'package:ui_multicaixa/src/services/client_http_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(
  CreateAccountController(
    repository: CreateAccoutRepository(
      client: ClientHttpService()
     )
    )
  );

  locator.registerSingleton(
  LoginController(
    repository: LoginRepository(
      client: ClientHttpService()
     )
    )
  );

  locator.registerSingleton(
   ActivateAccountController(
    repository: ActivateAccountRepository(
      client: ClientHttpService()
     )
    )
  );

  locator.registerSingleton(
    UserController(
      repository: UserRepository(
        client: ClientHttpService()
      )
    )
  );

  locator.registerSingleton(
    SaldoController(
      repository: SaldoRepository(
        client: ClientHttpService()
      )
    )
  );

  locator.registerSingleton(
    TransferenciaController(
      repository: TransferenciaRepository(
        client: ClientHttpService()
      )
    )
  );
}
