import 'package:mobx/mobx.dart';
import '../../../core/base/base_store.dart';
import '../../../core/models/product_model.dart';
import '../../../data/mock_data.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore extends BaseStore with Store {
  @observable
  ObservableList<Product> products = ObservableList<Product>();

  @observable
  ProductCategory? selectedCategory;

  @computed
  List<Product> get filteredProducts {
    if (selectedCategory == null) {
      return products.toList();
    }
    return products.where((p) => p.category == selectedCategory).toList();
  }

  @action
  Future<void> fetchProducts() async {
    isLoading = true;
    await Future.delayed(const Duration(milliseconds: 500));
    products.clear();
    products.addAll(mockProducts);
    isLoading = false;
  }

  @action
  void setCategory(ProductCategory? category) {
    selectedCategory = category;
  }
}
