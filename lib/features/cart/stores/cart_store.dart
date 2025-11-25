import 'package:mobx/mobx.dart';
import '../../../core/base/base_store.dart';
import '../../../core/models/cart_item_model.dart';
import '../../../core/models/product_model.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore extends BaseStore with Store {
  @observable
  ObservableList<CartItem> cartItems = ObservableList<CartItem>();

  @computed
  double get totalPrice {
    double total = 0;
    for (var item in cartItems) {
      total += item.totalPrice;
    }
    return total;
  }

  @computed
  int get totalItems {
    int total = 0;
    for (var item in cartItems) {
      total += item.quantity;
    }
    return total;
  }

  @action
  void addItemToCart(Product product, int quantity) {
    var existingItemIndex = cartItems.indexWhere((item) => item.product.id == product.id);
    if (existingItemIndex != -1) {
      var existingItem = cartItems[existingItemIndex];
      cartItems[existingItemIndex] = CartItem(
        product: existingItem.product,
        quantity: existingItem.quantity + quantity,
      );
    } else {
      cartItems.add(CartItem(product: product, quantity: quantity));
    }
  }

  @action
  void increaseQuantity(CartItem item) {
    var index = cartItems.indexOf(item);
    if (index != -1) {
      cartItems[index] = CartItem(
        product: item.product,
        quantity: item.quantity + 1,
      );
    }
  }

  @action
  void decreaseQuantity(CartItem item) {
    var index = cartItems.indexOf(item);
    if (index != -1) {
      if (item.quantity > 1) {
        cartItems[index] = CartItem(
          product: item.product,
          quantity: item.quantity - 1,
        );
      } else {
        cartItems.removeAt(index);
      }
    }
  }

  @action
  void removeItem(CartItem item) {
    cartItems.remove(item);
  }
  
  @action
  void clearCart() {
    cartItems.clear();
  }
}
