import 'package:mobx/mobx.dart';
import 'package:ui_multicaixa/src/models/transferencia_model.dart';
import 'package:ui_multicaixa/src/models/transferencia_reponse.dart';
import 'package:ui_multicaixa/src/repository/transferencia_repository.dart';
part 'transferencia_controller.g.dart';

class TransferenciaController = _TransferenciaControllerBase with _$TransferenciaController;

abstract class _TransferenciaControllerBase with Store {
  final TransferenciaRepository repository;

  _TransferenciaControllerBase({this.repository});

  @observable
  bool isLoading = false;

  TransferenciaModel model = TransferenciaModel();

  Future<void> get() async {
    if(model.data == null) {
      isLoading = true;
    }

    final data = await repository.get();
    if(data != null) {
      isLoading = false;

      model = data;
    } else {
      model = TransferenciaModel(
        data: null,
        message: "Ocorreu um erro interno, tente mais tarde!"
      );
    }
  }

  Future<TransferenciaResponse> store({ObjetoTransferencia model}) async {
    isLoading = true;

    final data = await repository.store(model: model);
    if(data != null) {
      isLoading = false;
      return data;
    } else {
      isLoading = false;
      return TransferenciaResponse(
        data: null,
        message: "Ocorreu um erro interno tente mais tarde."
      );
    }
  }
}