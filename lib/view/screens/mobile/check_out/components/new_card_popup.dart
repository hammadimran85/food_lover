import 'package:flutter/material.dart';
import 'package:food_lover/responsive.dart';
import 'package:food_lover/theme.dart';
import 'package:food_lover/view/screens/mobile/check_out/components/input_field.dart';

class NewCardPopUp extends StatefulWidget {
  const NewCardPopUp({super.key, required this.onAddCard});

  final Function(String, String, String, String) onAddCard;

  @override
  State<NewCardPopUp> createState() => _NewCardPopUpState();
}

class _NewCardPopUpState extends State<NewCardPopUp> {
  late TextEditingController _nameOnCardController;
  late TextEditingController _cardNumberController;
  late TextEditingController _expirationDateController;
  late TextEditingController _cvvController;

  @override
  void initState() {
    _nameOnCardController = TextEditingController();
    _cardNumberController = TextEditingController();
    _expirationDateController = TextEditingController();
    _cvvController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      width: Responsive.screenWidth(context),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Add Card',
            style: theme.textTheme.titleLarge,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: AppSizes.sidePadding * 2),
          ),
          OpenFlutterInputField(
              controller: _nameOnCardController, hint: 'Name on card'),
          const Padding(
            padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
          ),
          OpenFlutterInputField(
              controller: _cardNumberController, hint: 'Card Number'),
          const Padding(
            padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
          ),
          OpenFlutterInputField(
              controller: _expirationDateController, hint: 'Expire Date'),
          const Padding(
            padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
          ),
          OpenFlutterInputField(controller: _cvvController, hint: 'CVV'),
          const Padding(
            padding: EdgeInsets.only(bottom: AppSizes.sidePadding * 2),
          ),
          ElevatedButton(
            onPressed: () {
              // Get the text from the controllers
              String nameOnCard = _nameOnCardController.text;
              String cardNumber = _cardNumberController.text;
              String expirationDate = _expirationDateController.text;
              String cvv = _cvvController.text;

              // Call the callback with the entered data
              widget.onAddCard(nameOnCard, cardNumber, expirationDate, cvv);

              // Clear the text fields after sending data
              _nameOnCardController.clear();
              _cardNumberController.clear();
              _expirationDateController.clear();
              _cvvController.clear();

              // Optionally, you can close the popup
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor),
            child: Text("Add Card",
                style: Theme.of(context).textTheme.titleMedium),
          ),
        ],
      ),
    );
  }
}
