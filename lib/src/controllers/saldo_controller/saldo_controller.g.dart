// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saldo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SaldoController on _SaldoControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_SaldoControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$modelAtom = Atom(name: '_SaldoControllerBase.model');

  @override
  SaldoModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(SaldoModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
model: ${model}
    ''';
  }
}
