import 'package:flutter/material.dart';
import 'package:regestration_form/pallete.dart';

class DropdownButtonCustom extends StatelessWidget {
  final String hint;
  final String label;
  final dynamic value;
  final List items;
  final Function onChanged;
  final Function validate;

  const DropdownButtonCustom({
    Key key,
    this.hint,
    this.label,
    this.value,
    this.items,
    this.onChanged,
    this.validate,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Pallete.darkGrey,
            ),
          ),
          Card(
            color: Pallete.light,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: Pallete.midGrey, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  validator: validate,
                  dropdownColor: Pallete.light,
                  hint: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(hint),
                  ),
                  isExpanded: true,
                  items: items
                      .map(
                        (e) => DropdownMenuItem<String>(
                          child: Text(e),
                          value: e,
                        ),
                      )
                      .toList(),
                  onChanged: onChanged,
                  value: value,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
