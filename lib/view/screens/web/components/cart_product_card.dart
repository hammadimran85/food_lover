import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_lover/models/food_items.dart';
import 'package:food_lover/providers/cart_items_provider.dart';
import 'package:food_lover/responsive.dart';

class ProductItemView extends StatefulWidget {
  const ProductItemView({super.key, required this.cartItem});

  final FoodItem cartItem;

  @override
  State<ProductItemView> createState() => _ProductItemViewState();
}

class _ProductItemViewState extends State<ProductItemView> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 10),
      decoration: BoxDecoration(color: theme.cardColor.withOpacity(0.4)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: 110,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset(widget.cartItem.imagePath),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.cartItem.title} \nLorem Scipaso Rakne clean',
                            style: theme.textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Rs ${widget.cartItem.price}/-',
                            style: theme.textTheme.titleMedium!
                                .copyWith(color: theme.primaryColor),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Adds on : 0 items',
                            style: theme.textTheme.titleSmall!.copyWith(
                                color: theme.textTheme.titleSmall!.color!
                                    .withOpacity(0.5)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        return IconButton(
                          onPressed: () {
                            ref
                                .read(cartItemsProvider.notifier)
                                .removeItemFromCart(widget.cartItem);

                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                content: SizedBox(
                                  height:
                                      Responsive.screenHeight(context) * 0.09,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          'Removed from the Cart!',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.delete,
                            size: 20,
                            color: theme.colorScheme.error,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Consumer(
                          builder: (context, ref, child) {
                            return IconButton(
                              onPressed: () {
                                _decrementCounter();

                                ref
                                    .read(cartItemsProvider.notifier)
                                    .updateItemCartQuantity(
                                        widget.cartItem, _counter);
                              },
                              icon: Icon(
                                Icons.remove_circle,
                                size: 28,
                                color: theme.primaryColor,
                              ),
                            );
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: theme.disabledColor,
                              width: 1.0,
                            ),
                          ),
                          child: Text('$_counter'),
                        ),
                        Consumer(
                          builder: (context, ref, child) {
                            return IconButton(
                              onPressed: () {
                                _incrementCounter();

                                ref
                                    .read(cartItemsProvider.notifier)
                                    .updateItemCartQuantity(
                                        widget.cartItem, _counter);
                              },
                              icon: Icon(
                                Icons.add_circle,
                                size: 28,
                                color: theme.primaryColor,
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
