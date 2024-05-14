import 'package:flutter/material.dart';
import 'package:food_lover/constants.dart';
import 'package:food_lover/models/food_items.dart';
import 'package:food_lover/responsive.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    super.key,
    required this.foodItem,
    required this.updateCounter,
  });
  final FoodItem foodItem;

  final Function(int value) updateCounter;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 20),
              child: Text(
                '${widget.foodItem.price.toInt()} Rs',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 28,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Theme.of(context).primaryColor),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          _decrementCounter();
                          widget.updateCounter(_counter);
                        },
                        iconSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      child: Center(
                        child: Text(
                          '$_counter',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.8),
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          _incrementCounter();
                          widget.updateCounter(_counter);
                        },
                        color: Colors.white,
                        iconSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, top: 15),
          width: Responsive.screenWidth(context) * 0.8,
          child: Column(
            children: [
              Text(
                widget.foodItem.description,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: defaultTextSize + 2),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${widget.foodItem.description} Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: defaultTextSize + 2),
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
