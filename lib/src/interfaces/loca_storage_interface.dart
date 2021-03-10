abstract class ILocalStorage {

  Future<dynamic> get({String key});

  Future<void> put({String key, dynamic value});

  Future<bool> remove({String key});
}