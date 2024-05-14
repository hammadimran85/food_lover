import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_lover/providers/food_items_provider.dart';
import 'package:food_lover/view/screens/web/components/product_card.dart';

class ProductList extends ConsumerWidget {
  const ProductList({super.key, required this.recievedSelectedCategory});

  final String recievedSelectedCategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodItemsCategory = ref.watch(foodItemsProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Text(
            recievedSelectedCategory,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          ListView.builder(
            itemBuilder: (context, index) => ProductCard(
              item: foodItemsCategory[index],
            ),
          ),
        ],
      ),
    );
  }
}
