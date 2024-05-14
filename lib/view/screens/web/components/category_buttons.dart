import 'package:flutter/material.dart';
import 'package:food_lover/responsive.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTabLarge = Responsive.screenWidth(context) >= 950 &&
        Responsive.screenWidth(context) <= 1115;

    bool isTab = Responsive.isTablet(context);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    List<String> category = [
      'Pizza',
      'Burgers',
      'Starters',
      'Chinese',
      'Bowl',
      'Hosomaki',
      'Momos',
      'Bowl',
      'Salad',
      'Rice',
      'Beverage',
      'Drinks'
    ];

    List<String> row1;
    List<String> row2;

    double leftPadding;

    double leftPadding_2;

    double textFontSize;

    if (isTab && !isTabLarge) {
      row1 = category.sublist(0, category.length - 5);
      row2 = category.sublist(category.length - 5, category.length);
      leftPadding = screenWidth * 0.07;
      leftPadding_2 = screenWidth * 0.133;
      textFontSize = screenWidth * 0.018;
    } else if (isTabLarge) {
      row1 = category.sublist(0, category.length - 5);
      row2 = category.sublist(category.length - 5, category.length);
      leftPadding = screenWidth * 0.1;
      leftPadding_2 = screenWidth * 0.133;
      textFontSize = screenWidth * 0.015;
    } else {
      row1 = category.sublist(0, category.length - 4);
      row2 = category.sublist(category.length - 4, category.length);
      leftPadding = screenWidth * 0.137;
      leftPadding_2 = screenWidth * 0.170;
      textFontSize = screenWidth * 0.012;
    }

    // List<String> row1 = category.sublist(0, category.length - 4);
    // List<String> row2 = category.sublist(category.length - 4, category.length);

    int selectedCategoryIndex = 0;

    bool row11 = false;

    bool row22 = false;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: leftPadding,
            top: 20,
            right: leftPadding,
          ),
          width: Responsive.screenWidth(context),
          height: screenHeight * 0.053,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: row1.length,
            itemBuilder: (context, index) => Row(
              children: [
                InkWell(
                  onTap: () {
                    selectedCategoryIndex = index;
                    row11 = true;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: isTab ? screenWidth * 0.095 : screenWidth * 0.073,
                    height: screenHeight * 0.053,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      row1[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: textFontSize,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: leftPadding + leftPadding_2,
            top: 20,
          ),
          width: Responsive.screenWidth(context),
          height: screenHeight * 0.053,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: row2.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  InkWell(
                    onTap: () {
                      selectedCategoryIndex = index;
                      row22 = true;
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: isTab ? screenWidth * 0.095 : screenWidth * 0.073,
                      height: screenHeight * 0.053,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        row2[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: textFontSize,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
