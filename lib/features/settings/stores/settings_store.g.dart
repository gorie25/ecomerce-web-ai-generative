// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on _SettingsStore, Store {
  late final _$isDarkModeAtom = Atom(
    name: '_SettingsStore.isDarkMode',
    context: context,
  );

  @override
  bool get isDarkMode {
    _$isDarkModeAtom.reportRead();
    return super.isDarkMode;
  }

  @override
  set isDarkMode(bool value) {
    _$isDarkModeAtom.reportWrite(value, super.isDarkMode, () {
      super.isDarkMode = value;
    });
  }

  late final _$languageCodeAtom = Atom(
    name: '_SettingsStore.languageCode',
    context: context,
  );

  @override
  String get languageCode {
    _$languageCodeAtom.reportRead();
    return super.languageCode;
  }

  @override
  set languageCode(String value) {
    _$languageCodeAtom.reportWrite(value, super.languageCode, () {
      super.languageCode = value;
    });
  }

  late final _$_SettingsStoreActionController = ActionController(
    name: '_SettingsStore',
    context: context,
  );

  @override
  void toggleDarkMode() {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
      name: '_SettingsStore.toggleDarkMode',
    );
    try {
      return super.toggleDarkMode();
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLanguage(String code) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
      name: '_SettingsStore.setLanguage',
    );
    try {
      return super.setLanguage(code);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkMode: ${isDarkMode},
languageCode: ${languageCode}
    ''';
  }
}
