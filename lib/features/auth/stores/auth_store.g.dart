// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$usernameAtom = Atom(
    name: '_AuthStore.username',
    context: context,
  );

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$passwordAtom = Atom(
    name: '_AuthStore.password',
    context: context,
  );

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$loginAsyncAction = AsyncAction(
    '_AuthStore.login',
    context: context,
  );

  @override
  Future<bool> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$_AuthStoreActionController = ActionController(
    name: '_AuthStore',
    context: context,
  );

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
      name: '_AuthStore.setUsername',
    );
    try {
      return super.setUsername(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
      name: '_AuthStore.setPassword',
    );
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
password: ${password}
    ''';
  }
}
