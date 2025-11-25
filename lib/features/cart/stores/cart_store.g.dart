// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on _CartStore, Store {
  Computed<double>? _$totalPriceComputed;

  @override
  double get totalPrice =>
      (_$totalPriceComputed ??= Computed<double>(
            () => super.totalPrice,
            name: '_CartStore.totalPrice',
          ))
          .value;
  Computed<int>? _$totalItemsComputed;

  @override
  int get totalItems =>
      (_$totalItemsComputed ??= Computed<int>(
            () => super.totalItems,
            name: '_CartStore.totalItems',
          ))
          .value;

  late final _$cartItemsAtom = Atom(
    name: '_CartStore.cartItems',
    context: context,
  );

  @override
  ObservableList<CartItem> get cartItems {
    _$cartItemsAtom.reportRead();
    return super.cartItems;
  }

  @override
  set cartItems(ObservableList<CartItem> value) {
    _$cartItemsAtom.reportWrite(value, super.cartItems, () {
      super.cartItems = value;
    });
  }

  late final _$_CartStoreActionController = ActionController(
    name: '_CartStore',
    context: context,
  );

  @override
  void addItemToCart(Product product, int quantity) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
      name: '_CartStore.addItemToCart',
    );
    try {
      return super.addItemToCart(product, quantity);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseQuantity(CartItem item) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
      name: '_CartStore.increaseQuantity',
    );
    try {
      return super.increaseQuantity(item);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseQuantity(CartItem item) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
      name: '_CartStore.decreaseQuantity',
    );
    try {
      return super.decreaseQuantity(item);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(CartItem item) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
      name: '_CartStore.removeItem',
    );
    try {
      return super.removeItem(item);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCart() {
    final _$actionInfo = _$_CartStoreActionController.startAction(
      name: '_CartStore.clearCart',
    );
    try {
      return super.clearCart();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cartItems: ${cartItems},
totalPrice: ${totalPrice},
totalItems: ${totalItems}
    ''';
  }
}
