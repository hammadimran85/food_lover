import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_lover/models/food_items.dart';
import 'package:food_lover/providers/cart_items_provider.dart';
import 'package:food_lover/responsive.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.item});
  final FoodItem item;

  @override
  Widget build(BuildContext context) {
    bool isTabSpecial = Responsive.screenWidth(context) >= 795 &&
        Responsive.screenWidth(context) <= 885;

    bool isTabMedium = Responsive.screenWidth(context) >= 885 &&
        Responsive.screenWidth(context) <= 925;

    bool isTabSmall = Responsive.screenWidth(context) >= 600 &&
        Responsive.screenWidth(context) <= 650;

    bool isTabLarge = Responsive.screenWidth(context) >= 1025 &&
        Responsive.screenWidth(context) <= 1115;

    TextStyle? titleStyle;

    TextStyle? priceStyle;

    TextStyle? desStyle;

    int desMaxLine;

    if (isTabSmall) {
      desMaxLine = 2;
    } else if (isTabSpecial) {
      desMaxLine = 2;
    } else if (isTabLarge) {
      desMaxLine = 2;
    } else if (isTabMedium) {
      desMaxLine = 2;
    } else {
      desMaxLine = 3;
    }

    if (isTabSmall) {
      titleStyle = Theme.of(context).textTheme.titleMedium;
      priceStyle = Theme.of(context).textTheme.titleMedium;
      desStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).textTheme.bodySmall!.color,
          );
    } else if (isTabSpecial) {
      titleStyle = Theme.of(context).textTheme.titleSmall;
      priceStyle = Theme.of(context).textTheme.titleSmall;
      desStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).textTheme.bodySmall!.color,
          );
    } else if (isTabLarge) {
      titleStyle = Theme.of(context).textTheme.titleSmall;
      priceStyle = Theme.of(context).textTheme.bodySmall;
      desStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).textTheme.bodySmall!.color,
          );
    } else {
      titleStyle = Theme.of(context).textTheme.titleMedium;
      priceStyle = Theme.of(context).textTheme.titleMedium;
      desStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).textTheme.bodySmall!.color,
          );
    }

    return Card(
      margin: const EdgeInsets.only(right: 40),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: Responsive.screenHeight(context) * 0.203,
                width: Responsive.screenWidth(context) * 0.455,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 22.0, right: 35, top: 22, bottom: 22),
                  child: Image.asset(
                    item.imagePath,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 5,
                child: Consumer(
                  builder: (context, ref, child) {
                    return IconButton(
                      onPressed: () {
                        bool isAdded = ref
                            .read(cartItemsProvider.notifier)
                            .toggleItemInCartStatus(item, 1);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            content: SizedBox(
                              height: Responsive.screenHeight(context) * 0.09,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      isAdded
                                          ? 'Added to the Cart!'
                                          : 'Already in the Cart!',
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
                        Icons.add,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Container(
            width: Responsive.screenWidth(context) * 0.381,
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height: Responsive.screenHeight(context) * 0.001,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        item.title,
                        style: titleStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${item.price} Rs',
                      style: priceStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${item.description} Lorem sancna aoiwhje ajsnc oaiw acnkl ioine incasln lkndaln casnk emq,ekenf alsknclkas rnwlnc aliwnc aoiwhje ajsnc oaiw acnkl ioine incasln lkndaln aoiwhje ajsnc oaiw acnkl ioine incasln lkndaln',
                  maxLines: desMaxLine,
                  overflow: TextOverflow.ellipsis,
                  style: desStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
