import 'package:flutter/material.dart';
import 'package:food_lover/models/food_items.dart';
import 'package:food_lover/responsive.dart';
import 'package:food_lover/view/screens/web/components/product_card.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.categoryItem});

  final List<FoodItem> categoryItem;

  @override
  Widget build(BuildContext context) {
    bool isTab = Responsive.isTablet(context);

    List<FoodItem> updatedList = [];
    if (categoryItem.length > 7) {
      if (isTab) {
        updatedList = categoryItem.sublist(0, 5);
      } else {
        updatedList = categoryItem.sublist(0, 7);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        const Divider(),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            categoryItem[0].category,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child:
                // GridView.builder(
                //   shrinkWrap: true,
                //   scrollDirection: Axis.vertical,
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     childAspectRatio: 1,
                //     crossAxisSpacing: 20,
                //     mainAxisSpacing: 20,
                //   ),
                //   itemCount: categoryItem.length > 5 ? 5 : categoryItem.length,
                //   itemBuilder: (context, index) => ProductCard(
                //     item: categoryItem[index],
                //   ),
                // ),
                SizedBox(
              width: Responsive.screenWidth(context),
              height: Responsive.screenHeight(context) * 0.8,
              child: GridView.extent(
                maxCrossAxisExtent: isTab ? 348.5 : 308.0,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 30.0,
                children: categoryItem.length > 7
                    ? updatedList.map((e) => ProductCard(item: e)).toList()
                    : categoryItem.map((e) => ProductCard(item: e)).toList(),
              ),
            )),
      ],
    );
  }
}
