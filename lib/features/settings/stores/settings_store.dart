import 'package:mobx/mobx.dart';
import '../../../core/base/base_store.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore extends BaseStore with Store {
  @observable
  bool isDarkMode = false;

  @observable
  String languageCode = 'vi';

  @action
  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
  }

  @action
  void setLanguage(String code) {
    languageCode = code;
  }
}
