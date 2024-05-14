import 'package:flutter/material.dart';
import 'package:food_lover/responsive.dart';
import 'package:food_lover/theme.dart';

class PaymentCard extends StatelessWidget {
  final String cardNumber;

  const PaymentCard({super.key, required this.cardNumber});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        padding: const EdgeInsets.all(AppSizes.sidePadding),
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 34,
              color: Colors.amber,
              child: Image.asset('assets/images/checkout/mastercard.png',
                  height: 34),
            ),
            Container(
              padding: const EdgeInsets.only(left: AppSizes.sidePadding),
              child: Text(
                cardNumber,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.primaryColor,
                  fontSize: Responsive.isMobile(context)
                      ? 18
                      : Responsive.screenWidth(context) * 0.0129,
                ),
              ),
            )
          ],
        ));
  }
}
