import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_lover/models/food_items.dart';

class FoodItemsNotifier extends StateNotifier<List<FoodItem>> {
  FoodItemsNotifier() : super(allFoodItems);

  selectFoodItemCategory(String title) {
    if (title == 'All') {
      state = allFoodItems;
    } else {
      state = allFoodItems;
      state = state.where((item) => item.category == title).toList();
    }
  }
}

final foodItemsProvider =
    StateNotifierProvider<FoodItemsNotifier, List<FoodItem>>(
        (ref) => FoodItemsNotifier());
