import 'package:flutter/material.dart';
import 'package:regestration_form/pallete.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final bool hideInput;
  final Function validate;
  final TextEditingController controller;
  final int maxLines;

  const InputField({
    Key key,
    @required this.label,
    @required this.hint,
    this.hideInput = false,
    this.validate,
    this.controller,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 7.5,
        horizontal: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Pallete.darkGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              maxLines: maxLines,
              controller: controller,
              validator: validate,
              obscureText: hideInput,
              decoration: InputDecoration(
                filled: true,
                fillColor: Pallete.light,
                hintText: hint,
                enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Pallete.midGrey),
                ),
                focusedBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Pallete.darkGrey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
