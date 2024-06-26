import 'package:flutter/material.dart';
import 'package:food_lover/view/screens/mobile/check_out/check_out_mobile.dart';
import 'package:food_lover/view/screens/mobile/check_out/components/success2_view.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard(
      {super.key, required this.totalPrice, required this.isCartScreen});
  final double totalPrice;
  final bool isCartScreen;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -5),
            blurRadius: 10,
            color: const Color(0xFFDADADA).withOpacity(0.05),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      style: Theme.of(context).textTheme.titleLarge,
                      text: "Total:\n",
                      children: [
                        TextSpan(
                          text: "${totalPrice.toInt()} Rs",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => isCartScreen
                              ? const CheckOutMobileScreen()
                              : const Success2View(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor),
                    child: Text(
                      "Place Order",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontWeight: FontWeight.bold),
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
