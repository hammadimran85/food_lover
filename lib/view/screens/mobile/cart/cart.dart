import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_lover/models/food_items.dart';
import 'package:food_lover/providers/cart_items_provider.dart';
import 'package:food_lover/view/screens/mobile/cart/components/cart_card.dart';
import 'package:food_lover/view/screens/mobile/cart/components/check_out_card.dart';

class CartMobileScreen extends ConsumerWidget {
  const CartMobileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<FoodItem> cartItems = ref.watch(cartItemsProvider);
    double totalPrice = 0;

    for (FoodItem item in cartItems) {
      double itemPrice = item.cartQuantity * item.price;

      totalPrice = totalPrice + itemPrice;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 22,
              ),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              "Your Cart",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "${cartItems.length} items",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cart Items',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(cartItems[index].id.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      ref
                          .read(cartItemsProvider.notifier)
                          .removeItemFromCart(cartItems[index]);

                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Removed from Cart!'),
                        ),
                      );
                    },
                    background: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.error,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          SvgPicture.asset("assets/icons/Trash.svg"),
                        ],
                      ),
                    ),
                    child: CartCard(foodItem: cartItems[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CheckoutCard(
        isCartScreen: true,
        totalPrice: totalPrice,
      ),
    );
  }
}
