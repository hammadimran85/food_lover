import 'package:flutter/material.dart';
import 'package:food_lover/responsive.dart';
import 'package:food_lover/view/screens/mobile/check_out/components/add_address_card.dart';
import 'package:food_lover/view/screens/mobile/check_out/components/order_summary.dart';
import 'package:food_lover/view/screens/mobile/check_out/components/payment_method.dart';

class RightView extends StatelessWidget {
  const RightView({super.key});

  static var totalAmount;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: Responsive.screenWidth(context) * 0.278,
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 26,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20),
            decoration: BoxDecoration(color: theme.cardColor.withOpacity(0.4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Summary',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 2),
                  child: OrderSummary(
                    onTotalAmountChanged: (amount) {
                      totalAmount = amount;
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                if (!Responsive.isTablet(context))
                  Center(
                      child: Container(
                    width: Responsive.screenWidth(context) * 0.22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: theme.primaryColor,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text("Place Order",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: theme.scaffoldBackgroundColor)),
                  )),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          Container(
            decoration: BoxDecoration(
              color: theme.cardColor.withOpacity(0.4),
            ),
            margin: const EdgeInsets.only(top: 10, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const AddressCard(),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: PaymentMethod(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Delivery Method',
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/checkout/fedex.png',
                          height: 18,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '2-3 Hours',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
