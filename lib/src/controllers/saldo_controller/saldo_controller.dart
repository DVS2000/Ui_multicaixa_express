import 'package:mobx/mobx.dart';
import 'package:ui_multicaixa/src/models/saldo_model.dart';
import 'package:ui_multicaixa/src/repository/saldo_repository.dart';

part 'saldo_controller.g.dart';

class SaldoController = _SaldoControllerBase with _$SaldoController;

abstract class _SaldoControllerBase with Store {
  final SaldoRepository repository;

  _SaldoControllerBase({this.repository});

  @observable
  bool isLoading = false;

  @observable
  SaldoModel model = SaldoModel();

  Future<void> get() async {
    if(model == null) {
      isLoading = true;
    }

    final data = await repository.get();

    if(data != null) {
      isLoading = false;
      model = data;
    } else {
      isLoading = false;
      model = SaldoModel(
        data: null,
        message: "Ocorreu um erro interno, tente mais tarde."
      );
    }
  }
}