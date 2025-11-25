// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductStore on _ProductStore, Store {
  Computed<List<Product>>? _$filteredProductsComputed;

  @override
  List<Product> get filteredProducts =>
      (_$filteredProductsComputed ??= Computed<List<Product>>(
            () => super.filteredProducts,
            name: '_ProductStore.filteredProducts',
          ))
          .value;

  late final _$productsAtom = Atom(
    name: '_ProductStore.products',
    context: context,
  );

  @override
  ObservableList<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$selectedCategoryAtom = Atom(
    name: '_ProductStore.selectedCategory',
    context: context,
  );

  @override
  ProductCategory? get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(ProductCategory? value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$fetchProductsAsyncAction = AsyncAction(
    '_ProductStore.fetchProducts',
    context: context,
  );

  @override
  Future<void> fetchProducts() {
    return _$fetchProductsAsyncAction.run(() => super.fetchProducts());
  }

  late final _$_ProductStoreActionController = ActionController(
    name: '_ProductStore',
    context: context,
  );

  @override
  void setCategory(ProductCategory? category) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
      name: '_ProductStore.setCategory',
    );
    try {
      return super.setCategory(category);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
selectedCategory: ${selectedCategory},
filteredProducts: ${filteredProducts}
    ''';
  }
}
