import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_lover/models/food_items.dart';
import 'package:food_lover/responsive.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.foodItem,
  });

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: Responsive.screenWidth(context) * 0.28,
          height: Responsive.screenHeight(context) * 0.12,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(foodItem.imagePath),
            ),
          ),
        ),
        const SizedBox(width: 17),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              foodItem.title,
              style: Theme.of(context).textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 3),
            Text(
              foodItem.category,
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                text: "${foodItem.price.toInt()} Rs",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                children: [
                  TextSpan(
                      text: " x${foodItem.cartQuantity}",
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
