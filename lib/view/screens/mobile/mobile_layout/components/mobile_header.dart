import 'package:flutter/material.dart';
import 'package:food_lover/constants.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.65,
      height: screenHeight * 0.0575,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1.5,
            color: Theme.of(context).disabledColor,
          )),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(defaultPadding),
          suffixIcon: const Icon(
            Icons.location_on_outlined,
            size: 23,
          ),
          hintText: 'Street no 4 ,  Johar Town near Bakery , Lahore.',
          hintMaxLines: 1,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
