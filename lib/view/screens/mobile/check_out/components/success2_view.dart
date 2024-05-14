import 'package:flutter/material.dart';
import 'package:food_lover/theme.dart';
import 'package:food_lover/view/screens/web/screens/web_layout.dart';

class Success2View extends StatelessWidget {
  const Success2View({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
        color: theme.scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.only(top: AppSizes.sidePadding * 5),
                child: Image.asset('assets/images/checkout/bags.png')),
            Padding(
              padding: const EdgeInsets.only(
                top: AppSizes.sidePadding * 3,
                left: AppSizes.sidePadding * 2,
                right: AppSizes.sidePadding * 2,
              ),
              child: Text('Success!', style: theme.textTheme.bodySmall),
            ),
            Padding(
                padding: const EdgeInsets.all(AppSizes.sidePadding * 2),
                child: Text(
                  'Your order will be delivered soon. Thank you for your order!',
                  style: theme.textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                )),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WebLayoutScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor),
              child: Text(
                "Back to Home",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
}
