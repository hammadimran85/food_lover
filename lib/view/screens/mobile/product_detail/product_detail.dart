import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_lover/models/food_items.dart';
import 'package:food_lover/providers/cart_items_provider.dart';
import 'package:food_lover/view/screens/mobile/cart/cart.dart';
import 'package:food_lover/view/screens/mobile/product_detail/components/detail_product_header.dart';
import 'package:food_lover/view/screens/mobile/product_detail/components/product_description.dart';

class ProductDetailMobileScreen extends ConsumerWidget {
  const ProductDetailMobileScreen({super.key, required this.foodItem});

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counter = 1;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Center(
          child: Text(
            foodItem.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartMobileScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.onSurface,
              size: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          DetailProductHeader(imagePath: foodItem.imagePath),
          ProductDescription(
            foodItem: foodItem,
            updateCounter: (count) {
              counter = count;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'Add ons',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 15),
            height: 42,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: 95,
                  height: 30,
                  child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Coke',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.add,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 20),
            child: Row(
              children: [
                Text(
                  'Total Price:  ',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '${foodItem.price * counter} Rs',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                  onPressed: () {
                    bool isAdded = ref
                        .read(cartItemsProvider.notifier)
                        .toggleItemInCartStatus(foodItem, counter);
                    if (isAdded) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartMobileScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Item already in the Cart!'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    'ADD TO CART',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
