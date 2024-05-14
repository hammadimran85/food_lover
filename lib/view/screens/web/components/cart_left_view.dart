import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_lover/providers/cart_items_provider.dart';
import 'package:food_lover/responsive.dart';
import 'package:food_lover/view/screens/web/components/cart_product_card.dart';

class LeftView extends ConsumerWidget {
  const LeftView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);

    final cartItems = ref.watch(cartItemsProvider);

    return Stack(
      children: [
        Container(
          height: Responsive.screenHeight(context),
          padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.all(30),
                decoration:
                    BoxDecoration(color: theme.cardColor.withOpacity(0.4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shopping Cart',
                          style: theme.textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check_box_rounded,
                              color: theme.primaryColor,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Select all Items',
                              style: theme.textTheme.bodySmall,
                            ),
                            Text(
                              '   |   ',
                              style: theme.textTheme.titleLarge!.copyWith(
                                  color: theme.disabledColor,
                                  fontWeight: FontWeight.w100),
                            ),
                            Text(
                              'Delete Selected Items',
                              style: theme.textTheme.titleSmall!
                                  .copyWith(color: theme.colorScheme.error),
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(
                      '${cartItems.length} Items',
                      style: theme.textTheme.titleMedium,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: Responsive.isTablet(context)
                    ? Responsive.screenHeight(context) * 0.48
                    : Responsive.screenHeight(context) * 0.63,
                child: ListView.builder(
                  itemCount: cartItems.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ProductItemView(
                    cartItem: cartItems[index],
                  ),
                ),
              ),
              // if (Responsive.isTablet(context))
              //   const SizedBox(
              //     height: 10,
              //   ),
              // if (Responsive.isTablet(context))
              //   const Positioned(
              //     bottom: 10,
              //     child: CheckoutCard(totalPrice: 2600),
              //   ),
            ],
          ),
        ),
      ],
    );
  }
}
