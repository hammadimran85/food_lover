import 'package:flutter/material.dart';
import 'package:food_lover/responsive.dart';
import 'package:food_lover/view/screens/mobile/cart/cart.dart';
import 'package:food_lover/view/screens/mobile/cart/components/check_out_card.dart';
import 'package:food_lover/view/screens/web/components/cart_left_view.dart';
import 'package:food_lover/view/screens/web/components/cart_right_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CartCheckoutScreen extends StatelessWidget {
  const CartCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return const Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(child: LeftView()),
                ),
                SingleChildScrollView(child: RightView()),
              ],
            );
          } else if (sizingInformation.deviceScreenType ==
              DeviceScreenType.tablet) {
            return Scaffold(
              bottomNavigationBar: CheckoutCard(
                totalPrice: RightView.totalAmount,
                isCartScreen: false,
              ),
              // height: double.infinity,
              // width: double.infinity,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Responsive.screenHeight(context) * 0.85,
                      child: const Expanded(
                        child: SingleChildScrollView(child: LeftView()),
                      ),
                    ),
                    SizedBox(
                      height: Responsive.screenHeight(context) + 70,
                      width: Responsive.screenWidth(context),
                      child: const SingleChildScrollView(child: RightView()),
                    ),
                    // const Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: CheckoutCard(totalPrice: 2600),
                    // ),
                  ],
                ),
              ),
            );
          } else {
            return const CartMobileScreen();
          }
        },
      ),
    );
  }
}
