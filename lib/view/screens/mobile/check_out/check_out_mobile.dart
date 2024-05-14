import 'package:flutter/material.dart';
import 'package:food_lover/theme.dart';
import 'package:food_lover/view/screens/mobile/cart/components/check_out_card.dart';
import 'package:food_lover/view/screens/mobile/check_out/components/add_address_card.dart';
import 'package:food_lover/view/screens/mobile/check_out/components/order_summary.dart';
import 'package:food_lover/view/screens/mobile/check_out/components/payment_method.dart';

class CheckOutMobileScreen extends StatefulWidget {
  const CheckOutMobileScreen({super.key});

  @override
  State<CheckOutMobileScreen> createState() => _CheckOutMobileScreenState();
}

class _CheckOutMobileScreenState extends State<CheckOutMobileScreen> {
  double totalAmount = 0;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          'Check out',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.onSurface,
              size: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Shipping Address',
                style: theme.textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const AddressCard(),
            const SizedBox(
              height: 30,
            ),
            const PaymentMethod(),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Delivery Method',
                style: theme.textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 15),
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
            const Padding(
              padding: EdgeInsets.only(top: AppSizes.sidePadding * 1.5),
            ),
            OrderSummary(
              onTotalAmountChanged: (amount) {
                totalAmount = amount;
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CheckoutCard(
        totalPrice: totalAmount,
        isCartScreen: false,
      ),
    );
  }
}
