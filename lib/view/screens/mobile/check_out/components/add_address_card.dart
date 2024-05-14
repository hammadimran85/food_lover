import 'package:flutter/material.dart';
import 'package:food_lover/responsive.dart';
import 'package:food_lover/view/screens/mobile/check_out/components/dynamic_bottom_sheet.dart';
import 'package:food_lover/view/screens/mobile/check_out/components/new_address_popup.dart';

class AddressCard extends StatefulWidget {
  const AddressCard({
    super.key,
  });

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  var personName = 'Name';

  List<List<String>> addresses = [];

  List<String> updatedAddress = [];
  @override
  Widget build(BuildContext context) {
    void addAddress(
        String fullName, String address, String city, String postal) {
      List<String> newAddress = [fullName, address, city, postal];

      setState(() {
        addresses.add(newAddress);
        // print(newAddress);
        updatedAddress = newAddress;
      });
    }

    void showAddAddressPopup(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyDraggableSheet(
              child: NewAddressPopUp(
            onAddAddress: addAddress,
          ));
        },
      );
    }

    void showAddAddressDialog(BuildContext context) {
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
                  child: NewAddressPopUp(onAddAddress: addAddress)),
            );
          });
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      elevation: 3,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  updatedAddress.isEmpty ? personName : updatedAddress[0],
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(
                  onPressed: () {
                    Responsive.isDesktop(context)
                        ? showAddAddressDialog(context)
                        : showAddAddressPopup(context);
                  },
                  child: Text(
                    updatedAddress.isEmpty ? 'Add' : 'Change',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              updatedAddress.isEmpty
                  ? 'Add Address'
                  : '${updatedAddress[1]}\n${updatedAddress[2]}, ${updatedAddress[3]}',
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).disabledColor,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
