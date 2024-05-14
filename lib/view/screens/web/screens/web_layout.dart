import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_lover/models/food_items.dart';
import 'package:food_lover/providers/food_items_provider.dart';
import 'package:food_lover/responsive.dart';
import 'package:food_lover/view/screens/mobile/mobile_layout/mobile_layout.dart';
import 'package:food_lover/view/screens/web/components/category_buttons.dart';
import 'package:food_lover/view/screens/web/components/footer%20copy.dart';
import 'package:food_lover/view/screens/web/components/product_page.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:food_lover/view/screens/web/components/carousel_slider.dart';
import 'package:food_lover/view/screens/web/components/header.dart';

class WebLayoutScreen extends StatelessWidget {
  const WebLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (Responsive.screenWidth(context) >= 1100) {
            return const WebLayout();
          } else if (Responsive.screenWidth(context) >= 602 &&
              Responsive.screenWidth(context) < 1100) {
            return const WebLayout();
          } else {
            return const MobileLayout();
          }
        },
      ),
    );
  }
}

class WebLayout extends ConsumerWidget {
  const WebLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    List<FoodItem> foodItemsCategory = ref.watch(foodItemsProvider);

    List<FoodItem> pizzaItems = foodItemsCategory
        .where(
          (element) => element.category == 'Pizza',
        )
        .toList();

    List<FoodItem> burgerItems = foodItemsCategory
        .where(
          (element) => element.category == 'Burgers',
        )
        .toList();

    List<FoodItem> drinksItems = foodItemsCategory
        .where(
          (element) => element.category == 'Drinks',
        )
        .toList();

    List<FoodItem> sauceItems = foodItemsCategory
        .where(
          (element) => element.category == 'Sauce',
        )
        .toList();

    List<FoodItem> chineseItems = foodItemsCategory
        .where(
          (element) => element.category == 'Chinese',
        )
        .toList();

    bool isTab = Responsive.isTablet(context);

    bool isTabLarge = Responsive.screenWidth(context) >= 950 &&
        Responsive.screenWidth(context) <= 1115;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            Center(
              child: SizedBox(
                  width: isTab ? screenWidth * 0.95 : screenWidth * 0.60,
                  child: const CarouselSliderWidget()),
            ),
            if (isTabLarge)
              const SizedBox(
                height: 10,
              ),
            const CategoryButton(),
            ProductPage(categoryItem: pizzaItems),
            ProductPage(categoryItem: burgerItems),
            ProductPage(categoryItem: chineseItems),
            ProductPage(categoryItem: drinksItems),
            ProductPage(categoryItem: sauceItems),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                // Container(
                //   width: Responsive.screenWidth(context),
                //   height: Responsive.screenHeight(context) * 0.4,
                //   color: Theme.of(context).scaffoldBackgroundColor,
                // ),
                Container(
                  width: Responsive.screenWidth(context),
                  height: Responsive.screenHeight(context) * 0.37,
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/images/plate1.png',
                        fit: BoxFit.cover,
                        width: screenWidth * 0.18,
                        height: screenHeight * 0.35,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enjoy Best Meal in Town',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed \ndo eiusmod tempor incididunt ut labore et dolore magna\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed \ndo eiusmod tempor incididunt ut labore et dolore magna',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Responsive.screenHeight(context) * 0.27,
                  width: Responsive.screenWidth(context),
                  child: Footer(
                    child: Card(
                      elevation: 2,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/images/dummy_logo.png',
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fit: BoxFit.cover,
                                width: screenWidth * 0.15,
                                height: screenHeight * 0.06,
                              ),
                            ),
                            Text('Copyright ©2020, All Rights Reserved.',
                                style: Theme.of(context).textTheme.titleMedium),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
