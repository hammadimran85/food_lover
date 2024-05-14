import 'package:flutter/material.dart';
import 'package:food_lover/responsive.dart';
import 'package:food_lover/theme.dart';
import 'package:food_lover/view/screens/mobile/check_out/components/input_field.dart';

class NewAddressPopUp extends StatefulWidget {
  const NewAddressPopUp({super.key, required this.onAddAddress});

  final Function(String, String, String, String) onAddAddress;

  @override
  State<NewAddressPopUp> createState() => _NewAddressPopUpState();
}

class _NewAddressPopUpState extends State<NewAddressPopUp> {
  late TextEditingController _fullNameController;
  late TextEditingController _addressController;
  late TextEditingController _cityController;
  late TextEditingController _postalController;

  @override
  void initState() {
    _fullNameController = TextEditingController(text: '');
    _addressController = TextEditingController(text: '');
    _cityController = TextEditingController(text: '');
    _postalController = TextEditingController(text: '');

    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _postalController.dispose();
    super.dispose();
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
            'Add Address',
            style: theme.textTheme.titleLarge,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: AppSizes.sidePadding * 2),
          ),
          OpenFlutterInputField(
              controller: _fullNameController, hint: 'Full Name'),
          const Padding(
            padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
          ),
          OpenFlutterInputField(
              controller: _addressController, hint: 'Address'),
          const Padding(
            padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
          ),
          OpenFlutterInputField(controller: _cityController, hint: 'City'),
          const Padding(
            padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
          ),
          OpenFlutterInputField(controller: _postalController, hint: 'Postal'),
          const Padding(
            padding: EdgeInsets.only(bottom: AppSizes.sidePadding * 2),
          ),
          ElevatedButton(
            onPressed: () {
              String fullName = _fullNameController.text;
              String address = _addressController.text;
              String city = _cityController.text;
              String postal = _postalController.text;

              widget.onAddAddress(fullName, address, city, postal);

              _fullNameController.clear();
              _addressController.clear();
              _cityController.clear();
              _postalController.clear();

              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor),
            child: Text("Add Address",
                style: Theme.of(context).textTheme.titleMedium),
          ),
        ],
      ),
    );
  }
}
