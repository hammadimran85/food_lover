import 'package:flutter/material.dart';

class OpenFlutterInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final FormFieldValidator? validator;
  final TextInputType keyboard;
  final FocusNode? focusNode;
  final VoidCallback? onFinished;
  final bool isPassword;
  final double horizontalPadding;
  final Function? onValueChanged;
  final String? error;

  const OpenFlutterInputField(
      {super.key,
      required this.controller,
      required this.hint,
      this.validator,
      this.keyboard = TextInputType.text,
      this.focusNode,
      this.onFinished,
      this.isPassword = false,
      this.horizontalPadding = 16.0,
      this.onValueChanged,
      this.error});

  @override
  State<StatefulWidget> createState() {
    return OpenFlutterInputFieldState();
  }
}

class OpenFlutterInputFieldState extends State<OpenFlutterInputField> {
  late String? error;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    error = widget.error;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: TextField(
                onChanged: (value) => widget.onValueChanged!(value),
                style: Theme.of(context).textTheme.titleMedium,
                controller: widget.controller,
                focusNode: widget.focusNode,
                keyboardType: widget.keyboard,
                obscureText: widget.isPassword,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: widget.hint,
                    hintText: widget.hint,
                    suffixIcon: error != null
                        ? const Icon(
                            Icons.close,
                            color: Colors.red,
                          )
                        : isChecked
                            ? const Icon(Icons.done)
                            : null,
                    hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w300)),
              ),
            ),
          ),
          error == null
              ? Container()
              : Text(
                  error ?? '',
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                )
        ],
      ),
    );
  }

  String validate() {
    setState(() {
      error = widget.validator!(widget.controller.text)!;
    });
    return error ?? '';
  }
}
