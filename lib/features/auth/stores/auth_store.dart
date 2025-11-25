import 'package:mobx/mobx.dart';
import '../../../core/base/base_store.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore extends BaseStore with Store {
  @observable
  String username = '';

  @observable
  String password = '';

  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  Future<bool> login() async {
    isLoading = true;
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false;
    return true; // Always success
  }
}
