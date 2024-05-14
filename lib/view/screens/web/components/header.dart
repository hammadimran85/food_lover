import 'package:flutter/material.dart';
import 'package:food_lover/constants.dart';
import 'package:food_lover/responsive.dart';
import 'package:food_lover/view/screens/web/screens/cart_checkout.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTab = Responsive.isTablet(context);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/dummy_logo.png',
            color: Theme.of(context).colorScheme.onBackground,
            fit: BoxFit.cover,
            width: isTab ? screenWidth * 0.15 : screenWidth * 0.11,
            height: screenHeight * 0.039,
          ),
          Center(
            child: Container(
              width: screenWidth * 0.25,
              height: screenHeight * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1.5,
                    color: Theme.of(context).disabledColor,
                  )),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(defaultPadding + 5),
                  suffixIcon: const Icon(
                    Icons.location_on_outlined,
                    size: 23,
                  ),
                  hintText: 'Street no 4 ,  Johar Town near Bakery , Lahore.',
                  hintMaxLines: 1,
                  hintStyle: TextStyle(
                      fontSize: defaultTextSize,
                      color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
            ),
          ),
          Row(
            children: [
              TextButton.icon(
                icon: Icon(
                  Icons.shopping_cart_checkout_outlined,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartCheckoutScreen(),
                    ),
                  );
                },
                label: Text(
                  'Check Out',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          )
        ],
      ),
    );
  }
}
