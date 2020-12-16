import 'package:flutter/material.dart';
import 'package:regestration_form/models/user_model.dart';
import 'package:regestration_form/pallete.dart';

class DoneDialog extends StatelessWidget {
  final String message;

  const DoneDialog({
    Key key,
    this.message,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundColor: Pallete.green,
            child: Icon(
              Icons.check,
              size: 50.0,
              color: Pallete.light,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(message),
        ],
      ),
    );
  }
}
