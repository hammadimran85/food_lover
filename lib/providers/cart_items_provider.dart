import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_lover/models/food_items.dart';

class CartItemsNotifier extends StateNotifier<List<FoodItem>> {
  CartItemsNotifier() : super([]);

  bool toggleItemInCartStatus(FoodItem item, int cartQuantity) {
    final itemIsInCart = state.where((element) => element.id == item.id);
    final updatedState = List.of(state);

    if (itemIsInCart.isEmpty) {
      FoodItem itemUpd = FoodItem(
          id: item.id,
          title: item.title,
          description: item.description,
          price: item.price,
          imagePath: item.imagePath,
          category: item.category,
          addOn: item.addOn,
          cartQuantity: cartQuantity);

      state = [...updatedState, itemUpd];
      return true;
    } else {
      return false;
    }
  }

  void updateItemCartQuantity(FoodItem item, int cartQuantity) {
    final itemIsInCart = state.where((element) => element.id == item.id);
    final updatedState = List.of(state);
    if (itemIsInCart.isNotEmpty) {
      int itemIndex = updatedState.indexOf(item);
      updatedState.remove(item);
      FoodItem itemUpd = FoodItem(
          id: item.id,
          title: item.title,
          description: item.description,
          price: item.price,
          imagePath: item.imagePath,
          category: item.category,
          addOn: item.addOn,
          cartQuantity: cartQuantity);

      updatedState.insert(itemIndex, itemUpd);

      state = [...updatedState];
    }
  }

  bool removeItemFromCart(FoodItem item) {
    final updatedState = List.of(state);
    final itemIsInCart = updatedState.remove(item);

    state = updatedState;

    return itemIsInCart;
  }
}

final cartItemsProvider =
    StateNotifierProvider<CartItemsNotifier, List<FoodItem>>(
        (ref) => CartItemsNotifier());
