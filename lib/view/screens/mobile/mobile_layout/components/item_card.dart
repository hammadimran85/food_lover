import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_lover/models/food_items.dart';
import 'package:food_lover/providers/cart_items_provider.dart';
import 'package:food_lover/view/screens/mobile/product_detail/product_detail.dart';

class ItemCardMobile extends StatelessWidget {
  const ItemCardMobile({super.key, required this.foodItems});

  final List<FoodItem> foodItems;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailMobileScreen(
                        foodItem: foodItems[index],
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          foodItems[index].imagePath,
                          width: screenWidth * 0.3,
                          height: screenHeight * 0.12,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      foodItems[index]
                                                  .title
                                                  .split(" ")
                                                  .length >=
                                              2
                                          ? foodItems[index].title.split(" ")[0]
                                          : foodItems[index].title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    if (foodItems[index]
                                            .title
                                            .split(" ")
                                            .length >=
                                        2)
                                      Text(
                                        foodItems[index].title.split(" ")[1],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, right: 20),
                                  child: Text(
                                    '${foodItems[index].price.toInt()} Rs',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color:
                                                Theme.of(context).primaryColor),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.37,
                                  child: Text(foodItems[index].description,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Consumer(builder: (context, ref, child) {
                                      return IconButton(
                                        onPressed: () {
                                          bool isAdded = ref
                                              .read(cartItemsProvider.notifier)
                                              .toggleItemInCartStatus(
                                                  foodItems[index], 1);
                                          if (isAdded) {
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content:
                                                    Text('Added in the Cart!'),
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Item already in the Cart!'),
                                              ),
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      );
                                    }),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
