import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regestration_form/pallete.dart';
import 'package:regestration_form/ui/widgets/contact_us.dart';
import 'package:regestration_form/ui/widgets/rounded_button.dart';

class DesktopAppBar {
  static Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Engaz',
        style: TextStyle(
          color: Pallete.darkGrey,
          letterSpacing: -1.2,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Pallete.lightGrey,
      elevation: 0,
      actions: [
        RoundedButton(
          width: 160,
          height: 50,
          icon: Icon(Icons.mail),
          label: Text('Contact Us'),
          onPressed: () {
            Get.defaultDialog(title: 'Contact Us', content: ContactUs());
          },
          color: Pallete.darkGrey,
          labelColor: Pallete.light,
        ),
      ],
    );
  }
}
