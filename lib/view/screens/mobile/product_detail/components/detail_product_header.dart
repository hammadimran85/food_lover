import 'package:flutter/material.dart';
import 'package:food_lover/responsive.dart';

class DetailProductHeader extends StatelessWidget {
  const DetailProductHeader({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 10),
      height: Responsive.screenHeight(context) * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).primaryColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: Responsive.screenWidth(context) * 0.1,
          ),
          SizedBox(
            width: Responsive.screenWidth(context) * 0.61,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(imagePath),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Color.fromRGBO(255, 219, 25, 1),
                ),
                const SizedBox(
                  width: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5, top: 2),
                  child: Text('4.5',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: const Color.fromRGBO(255, 219, 25, 1))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
