import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_lover/providers/food_items_provider.dart';
import 'package:food_lover/view/screens/mobile/cart/cart.dart';
import 'package:food_lover/view/screens/mobile/mobile_layout/components/carousel_slider_mobile.dart';
import 'package:food_lover/view/screens/mobile/mobile_layout/components/category_text.dart';
import 'package:food_lover/view/screens/mobile/mobile_layout/components/item_card.dart';
import 'package:food_lover/view/screens/mobile/mobile_layout/components/mobile_header.dart';

class MobileLayout extends ConsumerWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    var recievedSelectedCategory = '';

    final foodItemsCategory = ref.watch(foodItemsProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(screenWidth, screenHeight * 0.1),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          flexibleSpace: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.030,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: MobileHeader(),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.02, right: 8),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_rounded,
                  size: 32,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.02, right: 8),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartMobileScreen()),
                  );
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 32,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Center(
            child: SizedBox(
                width: screenWidth * 0.90, child: const CarouselSliderMobile()),
          ),
          CategoryText(
            onCategorySelected: (selectedCategory) {
              recievedSelectedCategory = selectedCategory;
              // print(recievedSelectedCategory);
              ref
                  .read(foodItemsProvider.notifier)
                  .selectFoodItemCategory(recievedSelectedCategory);
              // print('$foodItemsCategory Items');
            },
          ),
          Expanded(
              child: ItemCardMobile(
            foodItems: foodItemsCategory,
          )),
        ],
      ),
    );
  }
}
