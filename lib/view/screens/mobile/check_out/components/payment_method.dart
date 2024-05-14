import 'package:flutter/material.dart';
import 'package:food_lover/responsive.dart';
import 'package:food_lover/view/screens/mobile/check_out/components/dynamic_bottom_sheet.dart';
import 'package:food_lover/view/screens/mobile/check_out/components/new_card_popup.dart';
import 'package:food_lover/view/screens/mobile/check_out/components/payment_card.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  List<String> updatedCard = [];

  List<List<String>> cards = [];

  @override
  Widget build(BuildContext context) {
    var cardNumber = '**** ***** **** 0000';

    void addCard(String nameOnCard, String cardNumber, String expirationDate,
        String cvv) {
      List<String> newCard = [nameOnCard, cardNumber, expirationDate, cvv];

      setState(() {
        cards.add(newCard);
        // print(newCard);
        updatedCard = newCard;
      });
    }

    void showAddCardPopup(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyDraggableSheet(
              child: NewCardPopUp(
            onAddCard: addCard,
          ));
        },
      );
    }

    void showAddCardDialog(BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              icon: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.error,
                  )),
              iconPadding: const EdgeInsets.only(left: 350, top: 40),
              content: SizedBox(
                  width: Responsive.screenWidth(context) * 0.3,
                  height: Responsive.screenHeight(context) * 0.65,
                  child: NewCardPopUp(
                    onAddCard: addCard,
                  )),
            );
          });
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pay with',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: TextButton(
                  onPressed: () {
                    Responsive.isDesktop(context)
                        ? showAddCardDialog(context)
                        : showAddCardPopup(context);
                  },
                  child: Text(
                    updatedCard.isEmpty ? 'Add' : 'Change',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        PaymentCard(
          cardNumber: updatedCard.isEmpty
              ? cardNumber
              : '*** *** *** ${updatedCard[1].substring(
                  updatedCard[1].length - 4,
                  updatedCard[1].length,
                )}',
        ),
      ],
    );
  }
}
