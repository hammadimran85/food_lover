import 'package:flutter/material.dart';
import 'package:food_lover/constants.dart';

class CategoryText extends StatefulWidget {
  const CategoryText({super.key, required this.onCategorySelected});

  final void Function(String) onCategorySelected;

  @override
  State<CategoryText> createState() => _CategoryTextState();
}

class _CategoryTextState extends State<CategoryText> {
  List<String> categories = [
    'All',
    'Pizza',
    'Burgers',
    'Starters',
    'Chinese',
    'Bowl',
    'Hosomaki',
    'Momos',
    'Salad',
    'Rice',
    'Beverage',
    'Drinks',
    'Sauce'
  ];
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(10),
      height: screenHeight * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedCategoryIndex == index;
          return Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedCategoryIndex = index;

                    widget.onCategorySelected(categories[index]);
                  });
                },
                child: Text(
                  categories[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: isSelected ? primaryColor : disableColor,
                      ),
                ),
              ),
              const SizedBox(
                width: 30,
              )
            ],
          );
        },
      ),
    );
  }
}
