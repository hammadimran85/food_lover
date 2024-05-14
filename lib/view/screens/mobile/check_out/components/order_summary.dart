import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_lover/models/food_items.dart';
import 'package:food_lover/providers/cart_items_provider.dart';
import 'package:food_lover/theme.dart';

class OrderSummary extends ConsumerWidget {
  const OrderSummary({super.key, required this.onTotalAmountChanged});

  final void Function(double) onTotalAmountChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);

    final cartItems = ref.watch(cartItemsProvider);
    double totalPrice = 0;

    for (FoodItem item in cartItems) {
      double itemPrice = item.cartQuantity * item.price;

      totalPrice = totalPrice + itemPrice;
    }

    double deliveryCharges = 500;

    double totalSummary = totalPrice + deliveryCharges;

    onTotalAmountChanged(totalSummary);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order :',
              style: theme.textTheme.titleMedium!
                  .copyWith(color: theme.disabledColor),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                '$totalPrice Rs',
                style: theme.textTheme.titleMedium!
                    .copyWith(color: theme.primaryColor),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: AppSizes.sidePadding * 1.5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery :',
              style: theme.textTheme.titleMedium!
                  .copyWith(color: theme.disabledColor),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                '$deliveryCharges Rs',
                style: theme.textTheme.titleMedium!
                    .copyWith(color: theme.primaryColor),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: AppSizes.sidePadding * 1.5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Summary :',
              style: theme.textTheme.titleMedium!
                  .copyWith(color: theme.disabledColor),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                '$totalSummary Rs',
                style: theme.textTheme.titleMedium!
                    .copyWith(color: theme.primaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
